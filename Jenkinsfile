pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building app'
            }
        }
        stage('Test') {
            when {
                expression {
                    BRANCH_NAME == 'myjenkins-jobs'
                }
            }
            steps {
                echo 'Testing app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
