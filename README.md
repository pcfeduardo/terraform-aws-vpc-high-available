## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) (resource)
- [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) (resource)
- [aws_main_route_table_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association) (resource)
- [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) (resource)
- [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block)

Description: VPC CIDR Block.

Type: `any`

### <a name="input_subnets_private"></a> [subnets\_private](#input\_subnets\_private)

Description: Blocks of private subnets that will be created. All private subnets are using egress to internet through NAT Gateway.

Type:

```hcl
map(object({
    cidr_block        = string
    availability_zone = string
  }))
```

### <a name="input_subnets_public"></a> [subnets\_public](#input\_subnets\_public)

Description: Blocks of public subnets that will be created. All private subnets are using egress to internet through Internet Gateway.

Type:

```hcl
map(object({
    cidr_block        = string
    availability_zone = string
  }))
```

### <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name)

Description: VPC Name.

Type: `any`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center)

Description: Cost center name. It is good practice to set this variable to support FinOps operations.

Type: `string`

Default: `"-"`

### <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames)

Description: A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false.

Type: `bool`

Default: `true`

### <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support)

Description: A boolean flag to enable/disable DNS support in the VPC. Defaults to true.

Type: `bool`

Default: `true`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: Environment name to use as suffix.

Type: `string`

Default: `"NOT_DEFINED"`

### <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy)

Description: A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.

Type: `string`

Default: `"default"`

### <a name="input_owner"></a> [owner](#input\_owner)

Description: Owner or sponsor name of all VPC resources. It is good practice to set the VPC owner.

Type: `string`

Default: `"-"`

## Outputs

The following outputs are exported:

### <a name="output_eip_nat_gw"></a> [eip\_nat\_gw](#output\_eip\_nat\_gw)

Description: n/a

### <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets)

Description: n/a

### <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets)

Description: n/a

### <a name="output_vpc"></a> [vpc](#output\_vpc)

Description: n/a
