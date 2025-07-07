  terraform {
  backend "s3" {
    bucket = "terraform-remote-st"
    key    = "rds/terraform.tfstate"
    region = "us-east-1" 
 
    # For State Locking
    dynamodb_table = "terraform-locks"    
  } 
  } 