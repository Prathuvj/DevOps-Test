provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "app_repo" {
  name = "devops-pipeline-app"
}

resource "aws_ecs_cluster" "main" {
  name = "devops-pipeline-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "devops-pipeline-app"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = 256
  memory                  = 512

  container_definitions = jsonencode([
    {
      name  = "devops-pipeline-app"
      image = "${aws_ecr_repository.app_repo.repository_url}:latest"
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "devops-pipeline-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-xxxxxx"] # Replace with your subnet ID
    security_groups  = ["sg-xxxxxx"]     # Replace with your security group ID
    assign_public_ip = true
  }
} 