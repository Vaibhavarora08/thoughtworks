resource "aws_efs_file_system" "technogisedbefs" {
  tags = {
    Name = "technogisedbefs"
  }
}

locals {
  subnets = ["${aws_subnet.technogise_public_sn_01.id}", "${aws_subnet.technogise_public_sn_02.id}"]
}

resource "aws_efs_mount_target" "technogisedbefs-mnt" {
  count = "2"

  file_system_id = "${aws_efs_file_system.technogisedbefs.id}"
  subnet_id = "${element(local.subnets, count.index)}"

  security_groups = ["${aws_security_group.technogise_public_sg.id}"]

}
