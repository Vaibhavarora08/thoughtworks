variable "apply_immediately" {
  default = "false"
  description = "Whether to deploy changes to the database immediately (true) or at the next maintenance window (false)."
}

resource "aws_db_instance" "rds_twork_mysql" {
  allocated_storage      = 10
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "rds_twork_mysql"
  username               = "foo"
  password               = "foobarbaz"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = "${aws_db_subnet_group.rds_twork.name}"
  vpc_security_group_ids = ["${aws_security_group.rds_twork_mysql.id}"]
  apply_immediately      = "${var.apply_immediately}"
  skip_final_snapshot    = true
}

resource "aws_instance" "rds_twork" {
  ami           = "${data.aws_ami.rds_twork_mysql.id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.my-key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.rds_twork_mysql.id}"]
  subnet_id = "${aws_subnet.rds_twork_a.id}"
}