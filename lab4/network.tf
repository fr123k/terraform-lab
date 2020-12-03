resource "aws_default_subnet" "default_subnet" {
    availability_zone = "eu-west-1a"
}

resource "null_resource" "get_client_ip" {
  provisioner "local-exec" {
    command = "curl -s ipinfo.io/ip | tr -d '\n' > client-ip.txt"
  }
}

data "local_file" "client_ip" {
    filename = "${path.module}/client-ip.txt"
  depends_on = [null_resource.get_client_ip]
}

resource "aws_security_group" "web_server_sec_group" {
  name = "web server security group"
  # allow ssh only
  ingress {
    from_port = 0
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${data.local_file.client_ip.content}/32"]
  }

  ingress {
    from_port = 0
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${data.local_file.client_ip.content}/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
