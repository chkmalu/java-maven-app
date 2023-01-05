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
                withCredentials(bindings: [usernamePassword(credentialsId: 'Nexus-pass', \
                                             usernameVariable: 'USERNAME', \
                                             passwordVariable: 'PASSWORD')]) {
                                                sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin 44.200.156.114:8083"
                                                sh "docker tag mvapp:1.1 chikamalu/mvapp:1.1"
                                             }
        }
    }
        stage('Deploy to DockerHub') {
            steps {
                sh "docker push chikamalu/mvapp:1.1"
            }
        }
    }
}
