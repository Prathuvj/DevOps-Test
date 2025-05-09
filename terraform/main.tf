provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "app" {
  name = "devops-app"
}

resource "aws_ecs_cluster" "main" {
  name = "devops-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "devops-app"
  network_mode            = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                     = 256
  memory                  = 512

  container_definitions = jsonencode([
    {
      name  = "devops-app"
      image = "${aws_ecr_repository.app.repository_url}:latest"
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
  name            = "devops-app-service"
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