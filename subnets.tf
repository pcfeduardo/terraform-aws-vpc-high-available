resource "aws_subnet" "private" {
  for_each = var.subnets_private

  cidr_block        = each.value.cidr_block
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.availability_zone
  tags = {
    Name        = "${local.name}-${each.key}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}

resource "aws_subnet" "public" {
  for_each = var.subnets_public

  cidr_block        = each.value.cidr_block
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.availability_zone
  tags = {
    Name        = "${local.name}-${each.key}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}