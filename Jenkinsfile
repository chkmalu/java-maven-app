pipeline {
    agent any
    tools {
        maven 'maven 3.8'
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
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
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
                echo 'Building App'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-pass', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh "echo ${USERNAME}"
                    sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin" 
         }
        }
        stage('Deploying') {
            steps {
                echo 'Deploying App'
            }
        }
    }
}