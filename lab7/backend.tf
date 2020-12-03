terraform {
    # The s3 bucket has to be created manualy before you can use this.
    # Also set the ~/.aws/credentials with the aws_access_key_id and aws_secret_access_key for this s3 bucket
    # backend "s3" {
    #     bucket = "tflearn-state"
    #     key = "tflearn-state/terraform.tfstate"
    #     region = "eu-west-1"
    #     profile = "learntf"
    # }
}
