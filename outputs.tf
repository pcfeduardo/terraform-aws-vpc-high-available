output "vpc" {
  value = {
    id         = aws_vpc.this.id
    arn        = aws_vpc.this.arn
    cidr_block = aws_vpc.this.cidr_block
    tags       = aws_vpc.this.tags
  }
}

output "eip_nat_gw" {
  value = {
    ip         = aws_eip.this.public_ip
    public_dns = aws_eip.this.public_dns
  }
}

output "private_subnets" {
  value = {
    for key, subnet in aws_subnet.private : key => {
      id                = subnet.id
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
    }
  }
}

output "public_subnets" {
  value = {
    for key, subnet in aws_subnet.public : key => {
      id                = subnet.id
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
    }
  }
}