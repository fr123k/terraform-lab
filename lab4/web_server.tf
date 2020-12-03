locals {
  webserver_ami = lookup(var.web_server_amis, var.aws_region)
}

resource "aws_instance" "web_server" {
  ami = local.webserver_ami // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
  subnet_id = aws_default_subnet.default_subnet.id

  key_name = aws_key_pair.deployer_keypair.key_name

  vpc_security_group_ids = [aws_security_group.web_server_sec_group.id] 

  depends_on = [aws_s3_bucket.learntf-bins] 

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh"
    ]
  }

  # Full Inline script example
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get install -y apache2",
  #     "sudo systemctl start apache2",
  #     "sudo groupadd www",
  #     "sudo usermod -a -G www ubuntu",
  #     "sudo usermod -a -G www www-data",
  #     "sudo chown -R www-data:www /var/www",
  #     "sudo chmod 770 -R /var/www" 
  #   ]
  # }

  provisioner "file" {
    source = "index.html"
    destination = "/var/www/html/index.html"
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("${path.module}/aws_rsa")
  }
}
