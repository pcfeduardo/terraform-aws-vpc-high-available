variable "cidr_block" {
  description = "VPC CIDR Block."
}
variable "vpc_name" {
  description = "VPC Name."
}
variable "environment" {
  default     = "NOT_DEFINED"
  description = "Environment name to use as suffix."
}
variable "cost_center" {
  default     = "-"
  description = "Cost center name. It is good practice to set this variable to support FinOps operations."
}
variable "owner" {
  default     = "-"
  description = "Owner or sponsor name of all VPC resources. It is good practice to set the VPC owner."
}

variable "instance_tenancy" {
  default     = "default"
  description = "A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
  validation {
    condition = anytrue([
      var.instance_tenancy == "default",
      var.instance_tenancy == "dedicated"
    ])
    error_message = "Instance_tenancy must be one of the following values: default, dedicated."
  }
}
variable "enable_dns_support" {
  default     = true
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  validation {
    condition = anytrue([
      var.enable_dns_support == true,
      var.enable_dns_support == false
    ])
    error_message = "Enable_dns_support must be one of the following values: true, false."
  }
}
variable "enable_dns_hostnames" {
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  validation {
    condition = anytrue([
      var.enable_dns_hostnames == true,
      var.enable_dns_hostnames == false
    ])
    error_message = "Enable_dns_hostnames must be one of the following values: true, false."
  }
}

variable "subnets_private" {
  description = "Blocks of private subnets that will be created. All private subnets are using egress to internet through NAT Gateway."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "subnets_public" {
  description = "Blocks of public subnets that will be created. All private subnets are using egress to internet through Internet Gateway."
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}