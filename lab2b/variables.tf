variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  default = "eu-west-1"
}

variable "web_server_amis" {
  type = map
}

variable "target_env" {
  default = "dev"
}
