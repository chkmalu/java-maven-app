pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing app'
            }
        }
        stage('Build') {
            when {
                expression {
                    BRANCH_NAME == 'myjenkins-jobs'
                }
            }
            steps {
                echo 'Building app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
