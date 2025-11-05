pipeline {
    agent any   // Runs on any available agent

tools {
    maven "maven-3.9"
}

stages {
        stage('Build jar') {
            steps {
                script{
                     echo "build the application"
                     sh 'mvn package'
                }
            }
        }

        stage('Build Image') {
            steps {
             script{
                  echo "build image"
             withCredentials([usernamePassword(credentialsId: "docker-hub", usernameVariable: "USER", passwordVariable: "PASS")]) {
                sh 'docker build -t ishannikeshala99/demo-app:jma-2.1 .'
                sh 'echo $PASS | docker login -u $USER --password-stdin'
                sh 'docker push ishannikeshala99/demo-app:jma-2.1'
              }
            }
            }
        }

        stage('Deploy') {
            steps {
               script{
                echo "deploy the application"
               }
            }
        }
    }

}
