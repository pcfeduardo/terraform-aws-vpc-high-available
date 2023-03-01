resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[keys(var.subnets_public)[0]].id
  tags = {
    Name        = "NATGW-${local.name}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_eip" "this" {
  vpc = true

  tags = {
    Name        = "EIP-NATGW-${local.name}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}
