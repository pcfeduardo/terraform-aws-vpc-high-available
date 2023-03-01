resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "rt-${local.name}-private"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_route_table_association" "private" {
  for_each       = var.subnets_private
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private.id
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.private.id
}