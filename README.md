# DevOps Pipeline Demo

This is a simple Flask application deployed using a complete DevOps pipeline with Docker, Jenkins, Terraform, and AWS.

## Prerequisites

1. Docker installed
2. Jenkins server running
3. AWS account with appropriate credentials
4. Terraform installed
5. Git installed

## Setup Instructions

### 1. Local Development
```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

### 2. Docker Build
```bash
docker build -t devops-app .
docker run -p 5000:5000 devops-app
```

### 3. Jenkins Setup
1. Create a new pipeline job in Jenkins
2. Configure it to use the Jenkinsfile from this repository
3. Add AWS credentials in Jenkins credentials store
4. Configure the pipeline to run on code changes

### 4. AWS Setup
1. Create an ECR repository
2. Update the AWS credentials in Jenkins
3. Update the subnet and security group IDs in terraform/main.tf

### 5. Terraform Deployment
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Pipeline Flow
1. Code is pushed to Git repository
2. Jenkins pipeline is triggered
3. Docker image is built and tested
4. Image is pushed to AWS ECR
5. Terraform deploys the application to AWS ECS

## Accessing the Application
Once deployed, the application will be available at the ECS service endpoint on port 5000. 