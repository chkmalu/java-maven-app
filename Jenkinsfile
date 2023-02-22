pipeline {
    agent any
    tool name: 'maven', type: 'maven'

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