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
                script{
                    buildjar()
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
                script{
                    buildimage('jmvapp:2.1 chikamalu/jvmapp:3.0')
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
