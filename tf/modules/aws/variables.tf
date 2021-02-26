
### REGIONS ####
variable "azs" {
  description = "Run the VDSS stack in these Availability Zones"
  type        = list(string)
  default     = ["us-gov-west-1a", "us-gov-west-1b"]
}


variable "region" {
  description = "The region to deploy the VPC in, e.g: us-east-1."
  type        = string
  default     = "us-gov-west-1"
}


#### DMZ VPC #####

variable "vpc_cidr" {
  description = "The CIDR block for the VPC, e.g: 10.0.0.0/16"
  type        = string
  default     = "10.0.0.0/16"
}
variable "dmz_vpc_name" {
  default = "VDSS_DMZ_VPC"
}


variable "mgmt_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.0.0.0/25"
    "us-gov-west-1b" = "10.0.0.128/25"
  }
}

variable "ext_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.0.1.0/24"
    "us-gov-west-1b" = "10.0.2.0/24"
  }
}
variable "int_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.0.5.0/24"
    "us-gov-west-1b" = "10.0.6.0/24"
  }
}

variable "inspect_ext_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.0.3.0/25"
    "us-gov-west-1b" = "10.0.4.0/25"
  }
}

variable "inspect_int_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.0.3.128/25"
    "us-gov-west-1b" = "10.0.4.128/25"
  }
}



##### MGMT VPC CIDR Blocks #####

variable "mgmt_int_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.1.0.0/25"
    "us-gov-west-1b" = "10.1.0.128/25"
  }
}

variable "mgmt_ext_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.1.1.0/25"
    "us-gov-west-1b" = "10.1.1.128/25"
  }
}

variable "mgmt_mgmt_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.1.2.0/25"
    "us-gov-west-1b" = "10.1.2.128/25"
  }
}

variable "devicediscovery_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.1.8.0/25"
    "us-gov-west-1b" = "10.1.8.128/25"
  }
}

variable "datacollect_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as subnets."
  type        = map(string)
  default = {
    "us-gov-west-1a" = "10.1.7.0/25"
    "us-gov-west-1b" = "10.1.7.128/25"
  }
}


#### TAGS ######
variable "owner" { default = "Jonathan Spigler" }
variable "project" { default = "VDSS" }
variable "tag" { default = "F5_VDSS" }

### IMAGES #####
variable "bigip_ami" { default = "ami-c13e76a0" }
variable "pan_ami" { default = "ami-917405f0" }
variable "volume_size" { default = 300 }

### BIG-IP EXTERNAL TIER ####
variable "bigipext_instancetype" { default = "m5.large" }
variable "number_ext_bigip_instances" { default = 2 }
variable "bigipext_name" { default = "bigipext" }


### BIG-IP INTERNAL TIER ####
variable "bigipint_instancetype" { default = "m5.xlarge" }
variable "number_int_bigip_instances" { default = 2 }
variable "bigipint_name" { default = "bigipint" }

### BIG-IP MGMT ####
variable "number_mgmt_bigip_instances" { default = 2 }
variable "bigip_mgmt_instancetype" { default = "m5.4xlarge" }
variable "bigipmgmt_name" { default = "bigipmgmt" }
variable "mgmt_vpc_name" { default = "VDSS_MGMT_VPC" }

### Palo DMZ Deployment ###
variable "pan_instance_type" { default = "m4.4xlarge" }
variable "pan_name" { default = "pan" }
variable "number_pan_instances" { default = 2 }

### Windows Deployment ####
variable "number_windows" { default = 0 }
variable "win_ami" { default = "ami-ff80cb9e" }
variable "win_instance_type" { default = "t2.large" }
variable "windows_key_name" { default = "windows" }

### KEYS ####
variable "key_name" { default = "" }
variable "public_key" { default = "" }



variable "big_ext_role" { default = "bigip-ext" }
variable "big_int_role" { default = "bigip-int" }
variable "big_mgmt_role" { default = "bigip_mgmt" }
