variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "python-devops-demo"
} 