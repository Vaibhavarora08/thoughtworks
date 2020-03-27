data "aws_ecs_task_definition" "technogise_app" {
  task_definition = "${aws_ecs_task_definition.technogise_app.family}"
  depends_on = ["aws_ecs_task_definition.technogise_app"]
}

resource "aws_ecs_task_definition" "technogise_app" {
  family                = "technogise_app"
  container_definitions = <<DEFINITION
[
  {
    "name": "technogise_app",
    "image": "${var.technogise_app_image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "technogise_app",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "memory": 1024,
    "cpu": 256
  }
]
DEFINITION
}
