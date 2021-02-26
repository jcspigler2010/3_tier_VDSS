


# Standalone (all-in-one) #
resource "aws_instance" "win2019" {
  count                       = var.number_windows
  ami                         = data.aws_ami.latest_win19_container.id
  instance_type               = var.win_instance_type
  key_name                    = var.windows_key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.mgmt_int[count.index].id
  vpc_security_group_ids      = [aws_security_group.Windowshttp.id, aws_security_group.f5_mgmt_allow_all_internal.id, aws_security_group.WindowsMGMTPorts.id]
  # aws_security_group.f5_mgmt_allow_all_internal.id,aws_security_group.WindowsMGMTPorts.id
  tags = {
    Name    = "Quick Windows 2019 Instance"
    Owner   = var.owner
    Project = var.project
  }

  root_block_device {
    volume_size = 200
  }
}

resource "aws_eip" "windows_eip" {
  count    = var.number_windows
  instance = element(aws_instance.win2019.*.id, count.index)
  vpc      = true
  tags = {
    Owner   = "${var.owner}"
    Project = "${var.project}"
  }
}
