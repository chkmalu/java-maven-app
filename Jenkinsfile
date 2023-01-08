@Library('jenkins-shares-library')_

pipeline {
    agent any
    tools {
        maven 'maven 3.8'
    }

    stages {
        stage('version incremental') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    version = matcher[0][1]
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
                    buildimage("jmvapp:2.1 chikamalu/jvmapp:${IMAGE_NAME}")
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
