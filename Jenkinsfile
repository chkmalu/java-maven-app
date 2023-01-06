@Library('jenkins-shares-library')

pipeline {
    agent any

    stages {
        stage('Build jarfile') {
            steps {
                echo 'Building jarfile'
                buidjar()
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
                buidimage()
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
