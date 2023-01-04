pipeline {
    agent any
    environment {
        VERSION = '1.2'
        MODEL = '250'
        CRED = credentials('Nexus-pass')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building app'
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
