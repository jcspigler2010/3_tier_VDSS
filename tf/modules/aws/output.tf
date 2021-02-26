output "ext_bigip" {

  description = "EXTERNAL BIG IP Information"
  value       = "------------EXTERNAL BIG IP Information-----------------------"

}

output "ext_f5_mgmt_public_ip" {

  value       = aws_eip.f5_external_mgmt.*.public_ip
  description = "External Big-IP Management Interfae Public IP"

}

output "ext_f5_mgmt_private_ip" {

  value       = aws_instance.bigip_external.*.private_ip
  description = "External Big-IP Management Interface Private IP"

}

output "ext_f5_ext_public_ip" {

  value       = aws_eip.external_eip.*.public_ip
  description = "External Big-IP External Interface Public IP"

}

output "ext_f5_ext_private_ip" {

  value       = aws_network_interface.bigip_external_interface.*.private_ips
  description = "External Big-IP External Interface Private IP"

}

output "ext_f5_inspect_private_ip" {

  value       = aws_network_interface.bigip_ext_inspect_interface.*.private_ip
  description = "External Big-IP Inspect Zone Interface Private IP"

}

output "int_bigip" {
  description = "INTERNAL BIG IP Information"
  value       = "---------------INTERNAL BIG IP Information--------------------"

}


output "int_f5_mgmt_public_ip" {

  value       = aws_eip.f5_internal_mgmt.*.public_ip
  description = "Internal Big-IP Management Interface Public IP"

}

output "int_f5_mgmt_private_ip" {

  value       = aws_instance.bigip_internal.*.private_ip
  description = "Internal Big-IP Management Interface Private IP"

}

output "int_f5_inspect_private_ip" {

  value       = aws_network_interface.bigip_int_inspect_interface.*.private_ips
  description = "Internal Big-IP Inspect Interface Private IP"

}

output "int_f5_tenant_private_ip" {

  value       = aws_network_interface.bigip_internal_interface.*.private_ip
  description = "Internal Big-IP Tenant Facing Interface Private IP"

}

output "mgmt_bigip" {
  description = "MANAGEMENT BIG IP Information"
  value       = "----------------MANAGEMENT BIG IP Information-------------------"

}


output "mgmt_f5_mgmt_public_ip" {

  value       = aws_eip.f5_mgmt_mgmt.*.public_ip
  description = "MGMT Big-IP Management Interface Public IP"

}

output "mgmt_f5_mgmt_private_ip" {

  value       = aws_instance.bigip_mgmt.*.private_ip
  description = "MGMT Big-IP Management Interface Private IP"

}

output "mgmt_f5_ext_private_ip" {

  value       = aws_network_interface.bigip_mgmt_ext_interface.*.private_ips
  description = "MGMT Big-IP External Interface Private IP"

}

output "mgmt_f5_internal_private_ip" {

  value       = aws_network_interface.bigip_mgmt_int_interface.*.private_ip
  description = "MGMT Big-IP Internal Interface Private IP"

}

output "pan_info" {

  description = "Palo Alto Information"
  value       = "---------------Palo Alto DMZ Information--------------------"

}


output "pan_mgmt_public_ip" {

  description = "Palo Alto Management Public IP"
  value       = aws_eip.pan_mgmt.*.public_ip

}

output "pan_mgmt_private_ip" {

  description = "Palo Alto Management Private IP"
  value       = aws_instance.pan_dmz.*.private_ip

}

output "pan_inspect_ext_private_ip" {

  value       = aws_network_interface.pan_inspect_ext_interface.*.private_ip
  description = "Palo Alto External Inspection Interface Private IP"

}

output "pan_inspect_int_private_ip" {

  value       = aws_network_interface.pan_inspect_int_interface.*.private_ip
  description = "Palo Alto Internal Inspection Interface Private IP"

}
