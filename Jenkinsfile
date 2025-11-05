pipeline {
    agent any   // Runs on any available agent

tools {
    maven "maven-3.9"
}

stages {
        stage('Build jar') {
            steps {
              echo "build the application"
              sh 'mvn package'
            }
        }

        stage('Build Image') {
            steps {
              echo "test the application"
              withCredentials([usernamePassword(credentialId:"docker-hub",usernameVariable:"USER",passwordVariable:"PASS")]){
                sh 'docker build -t ishannikeshala99/demo-app:jma-2.0 .'
                sh 'echo $PASS | docker login -u $USER --password-stdin'
                sh 'docker push ishannikeshala99/demo-app:jma-2.0'
              }
            }
        }

        stage('Deploy') {
            steps {
               echo "deploy the application"
            }
        }
    }

}
