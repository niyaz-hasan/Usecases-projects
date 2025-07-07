portfolio_name         = "instance Portfolio"
portfolio_description  = "Portfolio for provisioning Ec2 instance"
provider_name          = "niyaz"

product_name           = "instance Product"
product_owner          = "niyaz"
template_url           = "https://demotestbucketforservicecatalog.s3.us-east-1.amazonaws.com/ec2_instance.yml"
provisioning_name      = "v1"
template_constraint_parameters = {
  Rules = {
      AllowedInstanceTypes = {
        Assertions = [{
          Assert = {"Fn::Contains" = [["t2.micro", "t3.micro"], {"Ref" = "InstanceType"}]}
          AssertDescription = "Allowed instance types are t2.micro and t3.micro."
        }]
      }
    }
}
launch_role_arn          = "arn:aws:iam::975049998898:role/servicecatalogaccesss"
tag_key                  = "env"
tag_value                = "dev"
region                   = "us-east-1"
user_arn                 = "arn:aws:iam::975049998898:user/service-usr"