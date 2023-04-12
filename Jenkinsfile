pipeline {
    agent any

    stages {        
        stage('Copy Ansible files To Remote Server') {
            steps {
                script {
                    echo 'Copying Ansible files'
                    def ec2Instance = "ubuntu@52.202.212.247"

                    sshagent(['server-ssh-key']) {
                        sh "scp -o StrictHostKeyChecking=no ansible/* ${ec2Instance}:/home/ubuntu"
                        withCredentials([sshUserPrivateKey(credentialsId: 'SSH-Client-Key', keyFileVariable: 'keyfile', usernameVariable: 'username')]) {
                            sh "scp -o StrictHostKeyChecking=no ${keyfile} ${ec2Instance}:/home/ubuntu/ssh-key.pem"
                        }
                }
                }
            }
        }
        stage('Execute Ansible Playbook On Remote Server') {
            steps {
                script {
                    echo 'Executing Ansible playbook'
                    def command = "ansible-playbook install_docker.yaml"
                    def ec2Instance = "ubuntu@52.202.212.247"

                    sshagent(['server-ssh-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${command}"
                    }
                }
            }
        }
    }
}
