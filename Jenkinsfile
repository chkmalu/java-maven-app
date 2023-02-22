pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('Test') {
            steps {
                echo 'Testing app'
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}