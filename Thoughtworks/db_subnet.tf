resource "aws_db_subnet_group" "rds_test" {
  name       = "rds_test"
  subnet_ids = ["${aws_subnet.rds_test_a.id}", "${aws_subnet.rds_test_b.id}", "${aws_subnet.rds_test_c.id}"]
}

resource "aws_security_group" "rds_test_mysql" {
  name = "rds_test_mysql"
  description = "RDS Test MySQL Security Group"
  vpc_id = "${aws_vpc.rds_test.id}"
}