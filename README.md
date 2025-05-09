# Python DevOps Demo Application

This is a simple Python Flask application deployed using AWS, Docker, Terraform, and GitHub Actions.

## Prerequisites

- Python 3.11+
- Docker
- AWS CLI configured with appropriate credentials
- Terraform
- GitHub account

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

The application will be available at `http://localhost:5000`

## Docker Build

To build and run the Docker container locally:

```bash
docker build -t python-devops-demo .
docker run -p 5000:5000 python-devops-demo
```

## AWS Deployment

1. Initialize Terraform:
```bash
cd terraform
terraform init
```

2. Apply Terraform configuration:
```bash
terraform apply
```

## GitHub Actions Setup

1. Add the following secrets to your GitHub repository:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. Push to the main branch to trigger the deployment workflow.

## Infrastructure

The application is deployed on AWS using:
- ECR (Elastic Container Registry) for Docker images
- ECS (Elastic Container Service) for container orchestration
- Fargate for serverless container execution

## API Endpoints

- `GET /`: Welcome message
- `GET /health`: Health check endpoint 