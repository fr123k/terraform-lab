data "aws_availability_zones" "available" {}

output "availability_zones" {
  value = data.aws_availability_zones.available.*
}


# resource "aws_instance" "webservers" {
#   ami               = lookup(var.web_server_amis, var.aws_region)
#   instance_type     = "t2.micro"
#   count             = length(data.aws_availability_zones.available.names)
#   availability_zone = data.aws_availability_zones.available.names[count.index]
# }
