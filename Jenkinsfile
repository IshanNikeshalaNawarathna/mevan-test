pipeline {
    agent any

    tools {
        maven "maven-3.9"
    }

    stages {
        stage('Increment Version') {
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

        stage('Build Jar') {
            steps {
                script{
                    echo "Build the application."
                    sh 'mvn clean package'
                }

            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    withCredentials([usernamePassword(credentialsId: "docker-hub", usernameVariable: "USER", passwordVariable: "PASS")]) {
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                        sh "docker build -t ishannikeshala99/demo-app:${IMAGE_NAME} ."
                        sh "docker push ishannikeshala99/demo-app:${IMAGE_NAME}"
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script{
                    echo "Deploying application."
                }
              
            }
        }
        stage('commit version update') {
            steps {
                script {
                    echo "commit version update..."
                    withCredentials([usernamePassword(credentialsId: 'gitub-access', usernameVariable: "USER", passwordVariable: "PASS")]) {
                        sh "git add ."
                        sh "git commit -m 'ci: jenkins version modified'" 
                        sh "git push https://${USER}:${PASS}@github.com/IshanNikeshalaNawarathna/mevan-test.git HEAD:jenkins-branch"
                    }
                }
            }
        }
    }
}
