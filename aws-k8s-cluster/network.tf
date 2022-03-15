resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count                   = 2
  availability_zone       = var.availability_zone
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
    "name" = "${var.prefix}-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "name" = "${var.prefix}-internet-gateway"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    "name" = "${var.prefix}-route-table"
  }
}

resource "aws_route_table_association" "route-table-association" {
  count          = 2
  route_table_id = aws_route_table.route-table.id
  subnet_id      = aws_subnet.subnets.*.id[count.index]
}

resource "aws_security_group" "security-group" {
  vpc_id = aws_vpc.vpc.id
  egress {
    cidr_blocks     = ["0.0.0.0/0"]
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    prefix_list_ids = []
  }
  tags = {
    "name" = "${var.prefix}-security-group"
  }
}
