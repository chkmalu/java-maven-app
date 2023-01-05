pipeline {
    agent any
    tools {
        mavin 'maven 3.8'
    }

    stages {
        stage('Build jarfile') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t mvapp:1.1 .'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-pass', \
                                             usernameVariable: 'USERNAME', \
                                             passwordVariable: 'PASSWORD')]) {
                                                sh "echo ${USERNAME}"
                                             }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}
