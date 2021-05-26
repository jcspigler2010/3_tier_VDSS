
### Minimum Configurations to deploy ####

provider "aws" {
  alias                   = "aws-gov-west-1"
  region                  = "us-gov-west-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gov" ##Replace with profile name in credential files for AWS Gov
}

provider "aws" {
  alias                   = "aws-gov-east-1"
  region                  = "us-gov-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gov" ##Replace with profile name in credential files for AWS Gov
}



module "aws-gov-west-vdss-1" {

  providers = {
    aws = aws.aws-gov-west-1
  }
  source                      = "./modules/aws"
  key_name                    = "test"
  public_key                  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtkXEnQ0X3+aIfKP6NvyqPD/4DOrhY2ybuMXHAFnuXrP8qREmJ0Xkhz4ElMqFRnK/BEZSYnAAXwrMjsgDJPQpbmrUfx+6lf7uH72yuCN6GDzz69k97rUDS+IiKTmCkrEWU8IYXuQ9EaO0OSIykhTe9sYgkqcbGd13zT6r7cvQh+0so2UyLWvxkXUzyUihEI6zAW2xnosZV4kT+BtF7DL263H2o1yXIHD8lwUXVwhuOpskuWOnia93oiXoRCLM9UAq+IrfEvTchOoLb6HUCi6qGarM2Knfl5PKJXXZrET7cLKW3FnABzjFsusFQfmastwxs0RviB41ddX6TmIAU921v0qRa8IHyTU9UzCO5Q/sMnYYr9obzKWCZR6RjELsYkOqRtkmLzpZWOb8koATzsF7e7RryKnK6VoaA8Mo7hD9KzUz1ArIx4nphQsFWz75cNgNY3xldj9LgKTzCVTZKLKFcq9OkcF+wxcA65UmSGwq1cyKpP1MpcMpFqSTfKU56ViE= jonathanspigler@jonathans-mbp.lan"
  number_ext_bigip_instances  = 1
  number_int_bigip_instances  = 1
  azs                         = ["us-gov-west-1a"]
  number_mgmt_bigip_instances = 0
  stack_name                  = "aws-gov-west-vdss-1"



}

module "aws-gov-east-vdss-1" {

  providers = {
    aws = aws.aws-gov-east-1
  }
  stack_name                  = "aws-gov-east-vdss-1"
  source                      = "./modules/aws"
  key_name                    = "test"
  public_key                  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtkXEnQ0X3+aIfKP6NvyqPD/4DOrhY2ybuMXHAFnuXrP8qREmJ0Xkhz4ElMqFRnK/BEZSYnAAXwrMjsgDJPQpbmrUfx+6lf7uH72yuCN6GDzz69k97rUDS+IiKTmCkrEWU8IYXuQ9EaO0OSIykhTe9sYgkqcbGd13zT6r7cvQh+0so2UyLWvxkXUzyUihEI6zAW2xnosZV4kT+BtF7DL263H2o1yXIHD8lwUXVwhuOpskuWOnia93oiXoRCLM9UAq+IrfEvTchOoLb6HUCi6qGarM2Knfl5PKJXXZrET7cLKW3FnABzjFsusFQfmastwxs0RviB41ddX6TmIAU921v0qRa8IHyTU9UzCO5Q/sMnYYr9obzKWCZR6RjELsYkOqRtkmLzpZWOb8koATzsF7e7RryKnK6VoaA8Mo7hD9KzUz1ArIx4nphQsFWz75cNgNY3xldj9LgKTzCVTZKLKFcq9OkcF+wxcA65UmSGwq1cyKpP1MpcMpFqSTfKU56ViE= jonathanspigler@jonathans-mbp.lan"
  number_ext_bigip_instances  = 1
  number_int_bigip_instances  = 1
  azs                         = ["us-gov-east-1a"]
  number_mgmt_bigip_instances = 0
  mgmt_subnets = {
    "us-gov-east-1a" = "10.0.0.0/25"
    "us-gov-east-1b" = "10.0.0.128/25"
  }
  ext_subnets = {
    "us-gov-east-1a" = "10.0.1.0/24"
    "us-gov-east-1b" = "10.0.2.0/24"
  }
  int_subnets = {
    "us-gov-east-1a" = "10.0.3.0/24"
    "us-gov-east-1b" = "10.0.4.0/24"
  }
  inspect_ext_subnets = {
    "us-gov-east-1a" = "10.0.5.0/24"
    "us-gov-east-1b" = "10.0.6.0/24"
  }
  inspect_int_subnets = {
    "us-gov-east-1a" = "10.0.7.0/24"
    "us-gov-east-1b" = "10.0.8.0/24"
  }
  mgmt_int_subnets = {
    "us-gov-east-1a" = "10.1.0.0/25"
    "us-gov-east-1b" = "10.1.0.128/25"
  }
  mgmt_ext_subnets = {
    "us-gov-east-1a" = "10.1.1.0/24"
    "us-gov-east-1b" = "10.1.2.0/24"
  }
  mgmt_mgmt_subnets = {
    "us-gov-east-1a" = "10.1.3.0/24"
    "us-gov-east-1b" = "10.1.4.0/24"
  }
  devicediscovery_subnets = {
    "us-gov-east-1a" = "10.1.5.0/24"
    "us-gov-east-1b" = "10.1.6.0/24"
  }
  datacollect_subnets = {
    "us-gov-east-1a" = "10.1.7.0/24"
    "us-gov-east-1b" = "10.1.8.0/24"
  }

}
