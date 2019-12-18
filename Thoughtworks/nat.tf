resource "aws_security_group" "rds_twork_nat" {
  name = "rds_twork_nat"
  description = "Allow SSH"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.rds_twork.cidr_block}"]
  }

  vpc_id = "${aws_vpc.rds_twork.id}"
}