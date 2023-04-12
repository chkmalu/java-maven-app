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
                            'scp -o trictHostKeyChecking=no $keyfile $ec2Instance:/home/ubuntu/ssh-key.pem'
                        }
                }
                }
            }
        }
    }
}
