  terraform {
  backend "s3" {
    bucket = "terraform-remote-st"
    key    = "demo/terraform.tfstate"
    region = "us-east-1" 
 
    # For State Locking
    dynamodb_table = "terraform-locks"    
  } 
  } 