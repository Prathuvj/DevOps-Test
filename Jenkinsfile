pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'devops-app'
        AWS_CREDENTIALS = credentials('aws-credentials')
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run ${DOCKER_IMAGE} python -m pytest'
            }
        }
        
        stage('Push to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com
                    docker tag ${DOCKER_IMAGE}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/${DOCKER_IMAGE}:latest
                    docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/${DOCKER_IMAGE}:latest
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'terraform init && terraform apply -auto-approve'
            }
        }
    }
} 