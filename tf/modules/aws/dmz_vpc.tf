

resource "aws_vpc" "f5sandwich_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = var.dmz_vpc_name
  }

}

resource "aws_internet_gateway" "f5sandwich_gw" {

  vpc_id = aws_vpc.f5sandwich_vpc.id

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }

}

resource "aws_subnet" "f5sandwich_mgmt_subnet" {
  count             = length(var.mgmt_subnets)
  cidr_block        = element(values(var.mgmt_subnets), count.index)
  vpc_id            = aws_vpc.f5sandwich_vpc.id
  availability_zone = element(keys(var.mgmt_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.mgmt_subnets), count.index)}_dmz_mgmt_subnet"
  }
}

resource "aws_subnet" "f5sandwich_ext_subnet" {
  count             = length(var.ext_subnets)
  vpc_id            = aws_vpc.f5sandwich_vpc.id
  cidr_block        = element(values(var.ext_subnets), count.index)
  availability_zone = element(keys(var.ext_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.ext_subnets), count.index)}_dmz_ext_subnet"
  }

}

resource "aws_subnet" "f5sandwich_int_subnet" {
  count             = length(var.int_subnets)
  vpc_id            = aws_vpc.f5sandwich_vpc.id
  cidr_block        = element(values(var.int_subnets), count.index)
  availability_zone = element(keys(var.int_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.int_subnets), count.index)}_dmz_int_subnet"
  }

}

resource "aws_subnet" "f5sandwich_inspect_ext_subnet" {
  count             = length(var.inspect_ext_subnets)
  vpc_id            = aws_vpc.f5sandwich_vpc.id
  cidr_block        = element(values(var.inspect_ext_subnets), count.index)
  availability_zone = element(keys(var.inspect_ext_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.inspect_ext_subnets), count.index)}_dmz_inspect_ext_subnet"
  }

}

resource "aws_subnet" "f5sandwich_inspect_int_subnet" {
  count             = length(var.inspect_int_subnets)
  vpc_id            = aws_vpc.f5sandwich_vpc.id
  cidr_block        = element(values(var.inspect_int_subnets), count.index)
  availability_zone = element(keys(var.inspect_int_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.inspect_int_subnets), count.index)}_dmz_inspect_int_subnet"
  }

}



resource "aws_route" "r" {

  route_table_id         = aws_vpc.f5sandwich_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.f5sandwich_gw.id


}
