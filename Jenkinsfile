def gv

pipeline {
    agent any   // Runs on any available agent

tools {
    maven "maven-3.9"
}

stages {

       stage('init') {
            steps {
                script{
                    gv = load "script.groovy"
                }
            }
        }

        stage('Build jar') {
            steps {
                script{
                   gv.buildJar()
                }
            }
        }

        stage('Build Image') {
            steps {
             script{
gv.buildImage()
            }
            }
        }

        stage('Deploy') {
            steps {
               script{
               gv.deploy()
               }
            }
        }
    }

}
