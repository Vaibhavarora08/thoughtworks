resource "aws_ecs_cluster" "technogise_ecs_cluster" {
  name = "${var.ecs_cluster}"
}
