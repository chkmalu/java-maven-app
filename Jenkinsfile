pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }
    environment {
        REPO_NAME = '081241791096.dkr.ecr.us-east-1.amazonaws.com/'
        IMAGE_NAME = 'jvmapp'
        KUBECTL = '/var/jenkins_home/bin/kubectl'
    }

    stages {
        stage('Version Incremental.') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_TAG = "$version-$BUILD_NUMBER"
                }
            }
        }
        stage('Build Jarfile') {
            steps {
                echo 'Building Jarfile'
                script{
                    sh'mvn clean package'
                }
            }
        }
        stage('Build Image') {
            steps {
                script{
                    echo 'Building App'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-pass', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                        sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin"
                        sh "docker build -t ${REPO_NAME}${IMAGE_NAME}:${IMAGE_TAG} ."
                        sh "docker tag ${REPO_NAME}${IMAGE_NAME}:${IMAGE_TAG} ${REPO_NAME}${IMAGE_NAME}:${IMAGE_TAG}"
                        sh "docker push ${REPO_NAME}${IMAGE_NAME}:${IMAGE_TAG}"
                   }
                }
            }
           }
        stage('Deploying') {
            steps {
                echo 'Deploying App'
                sh "envsubst < k8files/jvmaapp-deployment.yaml | cat -"
            }
        }
        stage('Commit Version Update') {
            steps {
                echo "$BRANCH_NAME"
                // echo 'Updating Version'
                // sh 'git add .'
                // sh "git commit -m 'version update'"
                // sh "git push origin HEAD:$BRANCH_NAME"
            }
        }
    }
}