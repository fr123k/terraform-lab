locals {
  webserver_ami = lookup(var.web_server_amis, var.aws_region)
}

resource "aws_instance" "web_server" {
  ami = local.webserver_ami // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
  subnet_id = module.vpc.public_subnets[0]
}
