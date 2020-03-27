resource "aws_ecr_repository" "technogise" {
  name                 = "technogise"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

