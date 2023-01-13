@Library('jenkins-shares-library')_

pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('version incremental.') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                }
            }
        }
        stage('Build jarfile') {
            steps {
                echo 'Building jarfile'
                script{
                    buildjar()
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building app'
                script{
                    buildimage("chikamalu/jvmapp:${IMAGE_NAME}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    echo 'Deploying app'
                    def AppServer = '3.86.13.10'
                    def ShellCmd = "bash ./executables.sh ${IMAGE_NAME}"
                    sshagent(['Appserver-ssh-key']) {
                        sh "scp -o StrictHostKeyChecking=no executables.sh jsapp@${AppServer}:/home/jsapp/"
                        sh "scp -o StrictHostKeyChecking=no composefile.yml jsapp@${AppServer}:/home/jsapp/"
                        sh "ssh -o StrictHostKeyChecking=no jsapp@${AppServer} ${ShellCmd}"
                    }
                }
            }
        }
        stage('commit version') {
            steps {
                script{
                    versionupdate(BRANCH_NAME)
                }
            }
        }
    }
}
