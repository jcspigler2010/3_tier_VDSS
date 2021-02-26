3 tier VDSS Solution



```

### Prior to running ###
# create ssh key and place in keys directory

ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/jonathanspigler/.ssh/id_rsa): ./keys/test
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ./test.
Your public key has been saved in ./test.pub.
The key fingerprint is:
SHA256:oisW/R1Nhqy4xAjGH8jB0PxktW86TlYeqad4tlyUlCo jonathanspigler@jonathans-mbp.lan
The key's randomart image is:
+---[RSA 3072]----+
|+o   ..          |
| oo o  . .       |
|o o+  ..o.       |
|.= ..  +ooo      |
|...+E.o.S+       |
|  o.=o.O...      |
|   o.o*.+.       |
|  o .B+=.        |
| . .oo=.         |



### Minimum Configurations to deploy ####

provider "aws" {
  region                  = "us-gov-west-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gov" ##Replace with profile name in credential files for AWS Gov
}


module "aws" {

  source     = "./modules/aws"
  key_name   = "test"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtkXEnQ0X3+aIfKP6NvyqPD/4DOrhY2ybuMXHAFnuXrP8qREmJ0Xkhz4ElMqFRnK/BEZSYnAAXwrMjsgDJPQpbmrUfx+6lf7uH72yuCN6GDzz69k97rUDS+IiKTmCkrEWU8IYXuQ9EaO0OSIykhTe9sYgkqcbGd13zT6r7cvQh+0so2UyLWvxkXUzyUihEI6zAW2xnosZV4kT+BtF7DL263H2o1yXIHD8lwUXVwhuOpskuWOnia93oiXoRCLM9UAq+IrfEvTchOoLb6HUCi6qGarM2Knfl5PKJXXZrET7cLKW3FnABzjFsusFQfmastwxs0RviB41ddX6TmIAU921v0qRa8IHyTU9UzCO5Q/sMnYYr9obzKWCZR6RjELsYkOqRtkmLzpZWOb8koATzsF7e7RryKnK6VoaA8Mo7hD9KzUz1ArIx4nphQsFWz75cNgNY3xldj9LgKTzCVTZKLKFcq9OkcF+wxcA65UmSGwq1cyKpP1MpcMpFqSTfKU56ViE= jonathanspigler@jonathans-mbp.lan"

}

```
