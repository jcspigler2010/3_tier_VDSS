data "aws_ami" "latest_bigip_image" {
  most_recent = true
  owners      = ["345084742485", "679593333241", "874634375141"] # Canonical

  filter {
    name   = "description"
    values = ["*F5 BIGIP-16.* BYOL-All*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



data "aws_ami" "latest_win19_container" {
  most_recent = true
  owners      = ["077303321853", "801119661308"] # Canonical

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "latest_pan_ngfw_ami" {
  most_recent = true
  owners      = ["345084742485", "874634375141", "679593333241"] # Canonical

  filter {
    name   = "name"
    values = ["PA-VM-AWS-10.0.6-7064e142*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
