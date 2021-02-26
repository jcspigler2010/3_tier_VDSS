

resource "aws_eip" "f5_external_mgmt" {
  count                     = var.number_ext_bigip_instances
  vpc                       = true
  network_interface         = aws_instance.bigip_external[count.index].primary_network_interface_id
  associate_with_private_ip = aws_instance.bigip_external[count.index].private_ip

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }

}

resource "aws_eip" "external_eip" {
  count                     = var.number_ext_bigip_instances
  vpc                       = true
  network_interface         = aws_network_interface.bigip_external_interface[count.index].id
  associate_with_private_ip = aws_network_interface.bigip_external_interface[count.index].private_ip

  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}

resource "aws_network_interface" "bigip_external_interface" {
  count             = var.number_ext_bigip_instances
  subnet_id         = aws_subnet.f5sandwich_ext_subnet[count.index].id
  security_groups   = ["${aws_security_group.f5_allow_all_internal.id}", "${aws_security_group.f5_ext_vs_tier.id}", "${aws_security_group.f5_mgmt_iquery.id}", "${aws_security_group.f5_mgmt_ssh.id}"]
  source_dest_check = false
  private_ips_count = 2
  attachment {
    instance     = aws_instance.bigip_external[count.index].id
    device_index = 1
  }
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}



resource "aws_network_interface" "bigip_ext_inspect_interface" {
  count             = var.number_ext_bigip_instances
  subnet_id         = aws_subnet.f5sandwich_inspect_ext_subnet[count.index].id
  security_groups   = ["${aws_security_group.f5_allow_all_internal.id}"]
  source_dest_check = false
  attachment {
    instance     = aws_instance.bigip_external[count.index].id
    device_index = 2
  }
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}



resource "aws_instance" "bigip_external" {
  count                       = var.number_ext_bigip_instances
  ami                         = data.aws_ami.latest_bigip_image.id
  instance_type               = var.bigipext_instancetype
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.f5sandwich_mgmt_subnet[count.index].id
  root_block_device {

    delete_on_termination = true
    volume_size           = var.volume_size

  }
  vpc_security_group_ids = ["${aws_security_group.f5_mgmt_ssh.id}", "${aws_security_group.f5_mgmt_https.id}", "${aws_security_group.f5_mgmt_iquery.id}", "${aws_security_group.f5_allow_all_internal.id}"]

  tags = {

    Name    = "${var.bigipext_name}${count.index}"
    Owner   = "${var.owner}"
    Project = "${var.project}"
    Role    = var.big_ext_role

  }
}
