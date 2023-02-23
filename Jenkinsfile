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
                echo 'Provisioning Infra.'
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                steps {
                    pub_ip = sh('terraform output pub_ip', returnStdout: true).trim()
                }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying app'
                sleep(90, unit: 'SECONDS')
                sshagent(['ec2-user-Key']) {
                    sh "scp StrictHostKeyChecking=no compose ec2-user@${pub_ip}:/home/ec2-user"
                    sh "scp StrictHostKeyChecking=no deploment_script.sh ec2-user@${pub_ip}:/home/ec2-user"
                    sh "ssh ec2-user@${pub_ip} ./deployment_script.sh"
                }
            }
        }
    }
}