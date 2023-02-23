pipeline {
    agent any
    tools {
        maven 'maven'
        terraform 'terraform'
    }

    stages {
        stage('Test') {
            steps {
                echo 'Testing app'
                script {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Image') {
            steps {
                echo 'Building Image'
                script {
                    sh 'docker build -t jvmapp:4.0 .'
                    sh 'docker tag jvmapp:4.0 chikamalu/jvmapp:4.0'
                    withCredentials([usernamePassword(credentialsId: 'DockerAccess', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin"
                        sh 'docker push chikamalu/jvmapp:4.0'
                    }
                }
            }
        }
        stage('Provsion Infra.') {
            environment {
                access_key = credentials('ACCESS_KEY_ID')
                secret_key = credentials('SECRET_KEY_ID')
                }
            steps {
                echo 'Provisioning Infra.'
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
            }
        }
    }
}