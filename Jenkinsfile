@Library('jenkins-shares-library')_

pipeline {
    agent any

    stages {
        stage('Build jarfile') {
            steps {
                echo 'Building jarfile'
                script{
                    buidjar()
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
                script{
                    buidimage()
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
