resource "aws_dynamodb_table" "terraform_locks"{
  name = "${var.dynamodb}"
  hash_key ="LockID"

attribute {
  name = "LockID"
  type = "S"
}
}
