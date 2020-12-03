locals {
  webserver_ami = lookup(var.web_server_amis, var.aws_region)
}

resource "aws_instance" "web_server" {
  ami = local.webserver_ami // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
}

resource "aws_instance" "bastion" {
  ami = local.webserver_ami // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
  count = var.target_env == "dev" ? 0 : 3
}

data "template_file" "web_server_policy_template" {
  template = file("${path.module}/policy.tpl")
  vars = {
    arn = aws_instance.web_server.arn
  }
}
