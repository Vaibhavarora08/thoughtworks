#========================== TEST VPC =============================

# Declare the data source
data "aws_availability_zones" "available" {}


# Define a vpc
resource "aws_vpc" "technogise_vpc" {
  cidr_block = "${var.technogise_network_cidr}"
  tags = {
    Name = "${var.technogise_vpc}"
  }
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "technogise_ig" {
  vpc_id = "${aws_vpc.technogise_vpc.id}"
  tags = {
    Name = "technogise_ig"
  }
}

# Public subnet 1
resource "aws_subnet" "technogise_public_sn_01" {
  vpc_id = "${aws_vpc.technogise_vpc.id}"
  cidr_block = "${var.technogise_public_01_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    Name = "technogise_public_sn_01"
  }
}

# Public subnet 2
resource "aws_subnet" "technogise_public_sn_02" {
  vpc_id = "${aws_vpc.technogise_vpc.id}"
  cidr_block = "${var.technogise_public_02_cidr}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    Name = "technogise_public_sn_02"
  }
}

# Routing table for public subnet 1
resource "aws_route_table" "technogise_public_sn_rt_01" {
  vpc_id = "${aws_vpc.technogise_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.technogise_ig.id}"
  }
  tags = {
    Name = "technogise_public_sn_rt_01"
  }
}

# Associate the routing table to public subnet 1
resource "aws_route_table_association" "technogise_public_sn_rt_01_assn" {
  subnet_id = "${aws_subnet.technogise_public_sn_01.id}"
  route_table_id = "${aws_route_table.technogise_public_sn_rt_01.id}"
}

# Routing table for public subnet 2
resource "aws_route_table" "technogise_public_sn_rt_02" {
  vpc_id = "${aws_vpc.technogise_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.technogise_ig.id}"
  }
  tags = {
    Name = "technogise_public_sn_rt_02"
  }
}

# Associate the routing table to public subnet 2
resource "aws_route_table_association" "technogise_public_sn_rt_assn_02" {
  subnet_id = "${aws_subnet.technogise_public_sn_02.id}"
  route_table_id = "${aws_route_table.technogise_public_sn_rt_02.id}"
}

# ECS Instance Security group
resource "aws_security_group" "technogise_public_sg" {
  name = "technogise_public_sg"
  description = "Test public access security group"
  vpc_id = "${aws_vpc.technogise_vpc.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "${var.technogise_public_01_cidr}",
      "${var.technogise_public_02_cidr}"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "technogise_public_sg"
  }
}