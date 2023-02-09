@Library('jenkins-shares-library')_

pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('test App') {
            steps {
                echo 'Testing App'
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
                withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://C393D68EEF0CD7A027CA46A2F6A76DA6.gr7.us-east-1.eks.amazonaws.com']) {
                  sh 'kubectl create deployment ngx --image=nginx'
            }
        }
    }
}
