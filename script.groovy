def buildJar() {
    echo 'build the application'
    sh 'mvn package'
}
def buildImage(){
                      echo "build image"
             withCredentials([usernamePassword(credentialsId: "docker-hub", usernameVariable: "USER", passwordVariable: "PASS")]) {
                sh 'docker build -t ishannikeshala99/demo-app:jma-2.0 .'
                sh 'echo $PASS | docker login -u $USER --password-stdin'
                sh 'docker push ishannikeshala99/demo-app:jma-2.0'
              }
}
def deploy(){
     echo "deploy the application"
}


return this
