@Library('jenkins-shares-library')_

pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('Build jarfile') {
            steps {
                echo 'Building jarfile'
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
            }
        }
        stage('Deploy') {
            environment {
                AWS_ACCESS_KEY_ID = credentials('AWS_Access_key_ID')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_Secret_access_key')
            }
            steps {
                echo 'Deploying app'
                sh 'aws'
            }
        }
    }
}
