pipeline {
    agent any
    environment {
        VERSION = '1.2'
        MODEL = '250'
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
