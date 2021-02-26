

### Security Group (Firewall) rules ###


resource "aws_security_group" "f5_ext_vs_tier" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_f5 allow access to VSs"

  ingress {
    from_port        = "80"
    to_port          = "80"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  ingress {
    from_port        = "443"
    to_port          = "443"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = "53"
    to_port     = "53"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "53"
    to_port     = "53"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = "${var.project}_f5_vs_tier"
    Owner = "${var.owner}"
  }
}



resource "aws_security_group" "f5_mgmt_ssh" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_f5 allow ssh"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_int_vs_tier" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project} Internal Big-IP VS Tier"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16", "10.1.0.0/16", "172.0.0.0/16", "108.51.54.244/32"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "f5_mgmt_https" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_f5 allow https 443 and 8443"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "8443"
    to_port     = "8443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_iquery" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_f5_iquery"

  ingress {
    from_port   = "4353"
    to_port     = "4353"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_allow_all_internal" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_allow_all_internal"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16", "172.16.0.0/16", "10.1.0.0/16", "172.0.1.0/24", "10.100.0.0/16"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_only_pan" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_only_pan_ip"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.252/32"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.252/32"]
  }

  tags = {
    Name  = "${var.project}_f5_pan_only_ip"
    Owner = "${var.owner}"
  }

}

#### MGMT VPC security groups ####
resource "aws_security_group" "pan_sslo_mgmt_ssh_dmz" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_pan_sslo_ssh"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_sslo_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "pan_sslo_mgmt_https_dmz" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_pan_sslo_https"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}


resource "aws_security_group" "pan_sslo_internal_allow_all_dmz" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_pan_sslo_dataplane_all"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_mgmt_ssh" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project} mgmt vpc f5 allow ssh"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_mgmt_https" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project} f5 mgmt allow https 443 and 8443"

  ingress {
    from_port        = "443"
    to_port          = "443"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["108.51.54.244/32"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = "2222"
    to_port          = "2222"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = "8443"
    to_port          = "8443"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = "80"
    to_port          = "80"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_mgmt_iquery" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_f5_iquery"

  ingress {
    from_port   = "4353"
    to_port     = "4353"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "f5_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_allow_all_internal" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_mgmt_allow_all_internal"

  ingress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["10.1.0.0/16", "10.0.0.0/16", "172.0.1.0/24", "172.0.2.0/24"]
    ipv6_cidr_blocks = ["2600:1f12:f69:e000::/64", "2600:1f12:f69:e001::/64"]
  }

  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "f5_mgmt_allow_pua" {
  vpc_id = aws_vpc.mgmt_vpc.id
  name   = "${var.project}_mgmt_allow_all_pua"

  ingress {
    from_port   = "389"
    to_port     = "389"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "636"
    to_port     = "636"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = "1812"
    to_port     = "1812"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = "${var.project}_f5_mgmt_mgmt_pua"
    Owner = "${var.owner}"
  }
}




#security group creation
resource "aws_security_group" "pan_mgmt_ssh_dmz" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_pan_ssh"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "pan_mgmt_https_dmz" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_pan_https"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}


resource "aws_security_group" "pan_internal_allow_tcp_dmz" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_pan_dataplane_tcp"

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "pan_internal_allow_udp_dmz" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_pan_dataplane_udp"

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}

resource "aws_security_group" "pan_internal_allow_all_dmz" {
  vpc_id = aws_vpc.f5sandwich_vpc.id
  name   = "${var.project}_pan_dataplane_all}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}_pan_mgmt"
    Owner = "${var.owner}"
  }
}

### Security Group (Firewall) rules ###

resource "aws_security_group" "WindowsMGMTPorts" {
  vpc_id = aws_vpc.mgmt_vpc.id
  ingress {
    from_port   = "3389"
    to_port     = "3389"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "5985"
    to_port     = "5985"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "5985"
    to_port     = "5986"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Windows MGMT Ports"
    Owner   = var.owner
    Project = var.project
  }
}

resource "aws_security_group" "Windowshttp" {
  vpc_id = aws_vpc.mgmt_vpc.id
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "WindowsHTTPport"
    Owner   = var.owner
    Project = var.project
  }
}
