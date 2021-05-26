
resource "aws_eip" "pan_mgmt" {
  count                     = var.number_pan_instances
  vpc                       = true
  network_interface         = aws_instance.pan_dmz.*.primary_network_interface_id[count.index]
  associate_with_private_ip = aws_instance.pan_dmz.*.private_ip[count.index]
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }

}

resource "aws_instance" "pan_dmz" {
  count                       = var.number_pan_instances
  ami                         = data.aws_ami.latest_pan_ngfw_ami.id
  instance_type               = var.pan_instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.f5sandwich_mgmt_subnet[count.index].id

  vpc_security_group_ids = ["${aws_security_group.pan_mgmt_ssh_dmz.id}", "${aws_security_group.pan_mgmt_https_dmz.id}"]

  tags = {
    Name    = "${var.pan_name}${count.index}"
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}


resource "aws_network_interface" "pan_inspect_ext_interface" {
  count             = var.number_pan_instances
  subnet_id         = aws_subnet.f5sandwich_inspect_ext_subnet[count.index].id
  security_groups   = ["${aws_security_group.pan_internal_allow_all_dmz.id}"]
  source_dest_check = false
  attachment {
    instance     = aws_instance.pan_dmz[count.index].id
    device_index = 1
  }
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}

resource "aws_network_interface" "pan_inspect_int_interface" {
  count             = var.number_pan_instances
  subnet_id         = aws_subnet.f5sandwich_inspect_int_subnet[count.index].id
  security_groups   = ["${aws_security_group.pan_internal_allow_all_dmz.id}"]
  source_dest_check = false
  attachment {
    instance     = aws_instance.pan_dmz[count.index].id
    device_index = 2
  }
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}
