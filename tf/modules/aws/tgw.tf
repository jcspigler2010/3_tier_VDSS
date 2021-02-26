resource "aws_ec2_transit_gateway" "vdss_tgw" {

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "mgmt" {
  subnet_ids         = aws_subnet.mgmt_int[*].id
  transit_gateway_id = aws_ec2_transit_gateway.vdss_tgw.id
  vpc_id             = aws_vpc.mgmt_vpc.id

  tags = {
    Name    = "mgmt_int_attach"
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vdss" {
  subnet_ids         = aws_subnet.f5sandwich_int_subnet[*].id
  transit_gateway_id = aws_ec2_transit_gateway.vdss_tgw.id
  vpc_id             = aws_vpc.f5sandwich_vpc.id

  tags = {
    Name    = "vdss_int_attach"
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}


resource "aws_ec2_transit_gateway_route" "mgmt_out" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.mgmt.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.vdss_tgw.association_default_route_table_id
}
