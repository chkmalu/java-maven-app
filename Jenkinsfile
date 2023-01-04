pipeline {
    agent any
    environment {
        name = BRANCH_NAME
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building application'
                echo "the branch name is ${name}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing application'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application'
            }
        }
    }
}
