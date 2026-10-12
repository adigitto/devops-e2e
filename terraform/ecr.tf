resource "aws_ecr_repository" "frontend" {
    name = "front-end"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
    scan_on_push = true
    }
}

resource "aws_ecr_repository" "backend" {
    name = "back-end"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
    scan_on_push = true
    }   
}