pipeline {
    agent any
     
    stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/snteja/DevOps-Project.git'
          }
        }
        stage ('Build')
        {
            steps
            {
                sh label: '', script: 'mvn package'
            }
        }
        
        stage ('Sonar tests')
        {
            steps
            {
                withSonarQubeEnv(credentialsId: 'sonarqube') {
                    sh 'mvn sonar:sonar' }
            }
        }
    }
}
