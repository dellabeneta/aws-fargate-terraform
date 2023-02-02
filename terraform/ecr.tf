resource "aws_ecr_repository" "ecr-repository" {
  name = "doguinho"
  force_delete = true
}
