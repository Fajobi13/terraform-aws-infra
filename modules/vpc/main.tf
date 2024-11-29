
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-vpc"
  })
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidrs
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value
  map_public_ip_on_launch = true

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-public-${each.key}"
  })
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_cidrs
  vpc_id   = aws_vpc.main.id
  cidr_block = each.value

  tags = merge(var.default_tags, {
    Name = "${var.project_name}-private-${each.key}"
  })
}