pipeline {
    agent any
    tools {
        maven 'maven'
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
        stage('Building') {
            steps {
                echo 'Building App'
                script{
                    sh'mvn clean package'
                }
            }
        }
        stage('Deploying') {
            steps {
                echo 'Deploying App'
            }
        }
    }
}