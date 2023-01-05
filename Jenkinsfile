pipeline {
    agent any
    tools {
        maven 'maven 3.8'
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
                                                sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin"
                                                sh "docker tag mvapp:1.1 44.200.156.114:8083/mvapp:1.1"
                                             }
        }
    }
        stage('Deploy to image') {
            steps {
                sh "docker push 44.200.156.114:8083/mvapp:1.1"
            }
        }
    }
}
