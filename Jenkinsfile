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
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
                withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://0F582A7761707E7224F383C9297DDE6E.gr7.us-east-1.eks.amazonaws.com']) {
                sh 'kubectl apply -f my-kubernetes-directory'
            }
        }
    }
}
