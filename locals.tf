locals {
  name = var.environment == "NOT_DEFINED" ? var.vpc_name : "${var.vpc_name}-${var.environment}"
}