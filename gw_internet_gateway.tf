resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "igw-${local.name}"
    Environment = "${var.environment}"
    CostCenter  = "${var.cost_center}"
    Owner       = "${var.owner}"
  }
}
