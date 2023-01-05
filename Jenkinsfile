pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('Build jarfile') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t mvnapp:1.1 .'
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 081241791096.dkr.ecr.us-east-1.amazonaws.com"
                sh "docker tag mvnapp:1.1 081241791096.dkr.ecr.us-east-1.amazonaws.com/mvnapp:1.1"
        }
    }
        stage('Deploy image') {
            steps {
                sh "docker push 081241791096.dkr.ecr.us-east-1.amazonaws.com/mvnapp:1.1"
            }
        }
    }
}
