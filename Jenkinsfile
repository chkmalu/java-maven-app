@Library('jenkins-shares-library')_

pipeline {
    agent any
    tool:
    maven 'maven 3.8'

    stages {
        stage('Build jarfile') {
            steps {
                echo 'Building jarfile'
                script{
                    buildjar()
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
                script{
                    buildimage()
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
