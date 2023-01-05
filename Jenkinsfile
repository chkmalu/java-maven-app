pipeline {
    agent any
    tools {
        mavin 'maven 3.8'
    }

    stages {
        stage('Build') {
            steps {
                sh 'package'
            }
        }
        stage('Test') {

            steps {
                echo 'Testing app'
                echo "the version is ${VERSION}"
                echo "the model is ${MODEL}"
                echo "the cred is ${CRED}"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
