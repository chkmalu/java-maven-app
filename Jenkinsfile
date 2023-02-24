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
                script{
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                        pub_ip = sh(script:'terraform output pub_ip', returnStdout: true).trim()
                    }
                }
            }
        }
        stage('Deploy') {
            environment {
                DOCKER_CREDS = credentials('DockerAccess')
            }
            steps {
                script {
                    echo 'Deploying app'
                    echo "${pub_ip}"
                    sleep(time: 180, unit: 'SECONDS')
                    sshagent(['ec2-user-Key']) {
                        sh "scp -o StrictHostKeyChecking=no compose.yaml ec2-user@${pub_ip}:/home/ec2-user"
                        sh "scp -o StrictHostKeyChecking=no deploment_script.sh ec2-user@${pub_ip}:/home/ec2-user"
                        sh "ssh -o ec2-user@${pub_ip} ./deployment_script.sh ${DOCKER_CREDS_USR} ${DOCKER_CREDS_PWD}"
                }
                }
            }
        }
    }
}
