pipeline {
    agent any
    environment {
        VERSION = '1.2'
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
