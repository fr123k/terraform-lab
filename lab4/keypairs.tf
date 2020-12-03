resource "aws_key_pair" "deployer_keypair" {
  key_name = "bootstrap-key"
  public_key = file("${path.module}/aws_rsa.pub")
}
