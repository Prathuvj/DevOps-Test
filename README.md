# DevOps Pipeline Demo

This is a simple Flask application deployed using a complete DevOps pipeline with Docker, GitHub Actions, Terraform, and AWS.

## Prerequisites

- Python 3.9+
- Docker
- AWS Account
- GitHub Account
- Terraform

## Local Development

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run the application:
```bash
python app.py
```

## Docker

Build and run the Docker container:
```bash
docker build -t devops-pipeline-app .
docker run -p 5000:5000 devops-pipeline-app
```

## AWS Setup

1. Create an AWS account if you don't have one
2. Create an IAM user with appropriate permissions
3. Add the following secrets to your GitHub repository:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY

## Terraform Setup

1. Update the subnet and security group IDs in `terraform/main.tf`
2. Initialize Terraform:
```bash
cd terraform
terraform init
```

## Deployment

The application will automatically deploy when you push to the main branch. The GitHub Actions workflow will:
1. Build the Docker image
2. Push it to AWS ECR
3. Deploy the infrastructure using Terraform
4. Deploy the application to AWS ECS

## Accessing the Application

Once deployed, you can access the application at the URL provided by AWS ECS. 