

resource "aws_vpc" "mgmt_vpc" {
  cidr_block                       = "10.1.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = var.mgmt_vpc_name
  }

}

resource "aws_internet_gateway" "mgmt_gw" {

  vpc_id = aws_vpc.mgmt_vpc.id

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }

}

resource "aws_subnet" "mgmt_ext" {

  count                           = length(var.mgmt_ext_subnets)
  vpc_id                          = aws_vpc.mgmt_vpc.id
  cidr_block                      = element(values(var.mgmt_ext_subnets), count.index)
  availability_zone               = element(keys(var.mgmt_ext_subnets), count.index)
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.mgmt_vpc.ipv6_cidr_block, 8, count.index)
  assign_ipv6_address_on_creation = true

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.mgmt_ext_subnets), count.index)}_mgmt_ext_subnet"
  }

}



resource "aws_subnet" "mgmt_mgmt" {

  count             = length(var.mgmt_mgmt_subnets)
  vpc_id            = aws_vpc.mgmt_vpc.id
  cidr_block        = element(values(var.mgmt_mgmt_subnets), count.index)
  availability_zone = element(keys(var.mgmt_mgmt_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.mgmt_mgmt_subnets), count.index)}_mgmt_mgmt_subnet"
  }

}

resource "aws_subnet" "mgmt_int" {

  count             = length(var.mgmt_int_subnets)
  vpc_id            = aws_vpc.mgmt_vpc.id
  cidr_block        = element(values(var.mgmt_int_subnets), count.index)
  availability_zone = element(keys(var.mgmt_int_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.mgmt_int_subnets), count.index)}_mgmt_int_subnet"
  }

}

resource "aws_subnet" "mgmt_datacollect_subnet" {
  count             = length(var.datacollect_subnets)
  vpc_id            = aws_vpc.mgmt_vpc.id
  cidr_block        = element(values(var.datacollect_subnets), count.index)
  availability_zone = element(keys(var.datacollect_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.datacollect_subnets), count.index)}_mgmt_datacollect_subnet"
  }

}

resource "aws_subnet" "mgmt_devicediscovery_subnet" {
  count             = length(var.devicediscovery_subnets)
  vpc_id            = aws_vpc.mgmt_vpc.id
  cidr_block        = element(values(var.devicediscovery_subnets), count.index)
  availability_zone = element(keys(var.devicediscovery_subnets), count.index)
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_${element(keys(var.devicediscovery_subnets), count.index)}_mgmt_devicediscovery_subnet"
  }

}


resource "aws_route_table" "mgmt_egress_vpc_inner" {
  count  = var.number_mgmt_bigip_instances
  vpc_id = aws_vpc.mgmt_vpc.id

  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.bigip_mgmt_int_interface[count.index].id
  }
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Name    = "${var.project}_mgmt_egress_vpc_inner_rt${count.index}"
  }
}

resource "aws_route_table_association" "mgmt_int" {
  count          = var.number_mgmt_bigip_instances
  subnet_id      = aws_subnet.mgmt_int[count.index].id
  route_table_id = aws_route_table.mgmt_egress_vpc_inner[count.index].id
}

resource "aws_route" "mgmt_dw" {

  route_table_id         = aws_vpc.mgmt_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mgmt_gw.id


}

resource "aws_route" "mgmt_dw_ipv6" {

  route_table_id              = aws_vpc.mgmt_vpc.default_route_table_id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.mgmt_gw.id


}
