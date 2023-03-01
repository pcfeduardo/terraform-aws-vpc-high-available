# Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "rt-${local.name}-public"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  for_each       = var.subnets_public
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}