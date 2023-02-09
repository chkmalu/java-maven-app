pipeline {
    agent any
    tool name: 'maven 3.8' 
    type: 'maven'

    stages {
        stage('Testing') {
            steps {
                echo 'testing App'
            }
        }
        stage('Building') {
            steps {
                echo 'Building App'
            }
        }
        stage('Deploying') {
            steps {
                echo 'Deploying App'
            }
        }
    }
}