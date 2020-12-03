locals {
  webserver_ami = lookup(var.web_server_amis, var.aws_region)
}

resource "aws_instance" "web_server" {
  ami = local.webserver_ami // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
  subnet_id = aws_default_subnet.default_subnet.id
  depends_on = [aws_s3_bucket.learntf-bins] 
}
