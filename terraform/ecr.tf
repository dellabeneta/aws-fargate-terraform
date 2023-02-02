resource "aws_ecr_repository" "ecr_repository" {
  name = "doguinho"
  force_delete = true
}

