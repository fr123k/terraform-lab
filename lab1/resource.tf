resource "aws_instance" "myexample" {
  ami = "ami-0aef57767f5404a3c" // Ubuntu 20.04 LTS eu-west-1
  instance_type = "t2.micro"
}
