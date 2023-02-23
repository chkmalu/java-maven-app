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
            steps {
                withCredentials([string(credentialsId: 'ACCESS_KEY_ID', variable: 'access_key'), string(credentialsId: 'SECRET_KEY_ID', variable: 'secret_key')]) {
                    echo 'Provisioning Infra.'
                    environment {
                        access_key = "${access_key}"
                        secret_key = "${secret_key}"
                    }
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform plan'
                }
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