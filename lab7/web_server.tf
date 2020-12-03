resource "aws_instance" "web_server" {
  ami           = "ami-0aef57767f5404a3c"
  instance_type = "t2.micro"
} 
