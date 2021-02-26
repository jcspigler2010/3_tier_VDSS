
output "ext_bigip" {

  description = "EXTERNAL BIG IP Information"
  value       = module.aws.ext_bigip

}


output "ext_f5_mgmt_public_ip" {

  value       = module.aws.ext_f5_mgmt_public_ip
  description = "External Big-IP Management Interfae Public IP"

}

output "ext_f5_mgmt_private_ip" {

  value       = module.aws.ext_f5_mgmt_private_ip
  description = "External Big-IP Management Interface Private IP"

}

output "ext_f5_ext_public_ip" {

  value       = module.aws.ext_f5_ext_public_ip
  description = "External Big-IP External Interface Public IP"

}

output "ext_f5_ext_private_ip" {

  value       = module.aws.ext_f5_ext_private_ip
  description = "External Big-IP External Interface Private IP"

}

output "ext_f5_inspect_private_ip" {

  value       = module.aws.ext_f5_inspect_private_ip
  description = "External Big-IP Inspect Zone Interface Private IP"

}

output "int_bigip" {
  description = "INTERNAL BIG IP Information"
  value       = module.aws.int_bigip
}

output "int_f5_mgmt_public_ip" {

  value       = module.aws.int_f5_mgmt_public_ip
  description = "Internal Big-IP Management Interface Public IP"

}

output "int_f5_mgmt_private_ip" {

  value       = module.aws.int_f5_mgmt_private_ip
  description = "Internal Big-IP Management Interface Private IP"

}

output "int_f5_inspect_private_ip" {

  value       = module.aws.int_f5_inspect_private_ip
  description = "Internal Big-IP Inspect Interface Private IP"

}

output "int_f5_tenant_private_ip" {

  value       = module.aws.int_f5_tenant_private_ip
  description = "Internal Big-IP Tenant Facing Interface Private IP"

}

output "mgmt_bigip" {
  description = "MANAGEMENT BIG IP Information"
  value       = module.aws.mgmt_bigip

}


output "mgmt_f5_mgmt_public_ip" {

  value       = module.aws.mgmt_f5_mgmt_public_ip
  description = "MGMT Big-IP Management Interface Public IP"

}

output "mgmt_f5_mgmt_private_ip" {

  value       = module.aws.mgmt_f5_mgmt_private_ip
  description = "MGMT Big-IP Management Interface Private IP"

}

output "mgmt_f5_ext_private_ip" {

  value       = module.aws.mgmt_f5_ext_private_ip
  description = "MGMT Big-IP External Interface Private IP"

}

output "mgmt_f5_internal_private_ip" {

  value       = module.aws.mgmt_f5_internal_private_ip
  description = "MGMT Big-IP Internal Interface Private IP"

}

output "pan_info" {

  description = "Palo Alto Information"
  value       = module.aws.pan_info

}

output "pan_mgmt_public_ip" {

  description = "Palo Alto Management Public IP"
  value       = module.aws.pan_mgmt_public_ip

}

output "pan_mgmt_private_ip" {

  description = "Palo Alto Management Private IP"
  value       = module.aws.pan_mgmt_private_ip

}

output "pan_inspect_ext_private_ip" {

  value       = module.aws.pan_inspect_ext_private_ip
  description = "Palo Alto External Inspection Interface Private IP"

}

output "pan_inspect_int_private_ip" {

  value       = module.aws.pan_inspect_int_private_ip
  description = "Palo Alto Internal Inspection Interface Private IP"

}
