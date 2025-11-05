pipeline {
    agent any   // Runs on any available agent

    stages {
        stage('Test') {
            steps {
              echo "test the application"
              echo "Executing pipeline on branch: $BRANCH_NAME"
            }
        }
        stage('Build') {
            when{
                expression {
                    BRANCH_NAME == 'main' 
                }
            }
            steps {
              echo "build the application"
            }
        }
        stage('Deploy') {
            when{
                expression {
                    BRANCH_NAME == 'main' 
                }
            }
            steps {
               echo "deploy the application"
            }
        }
    }

}
