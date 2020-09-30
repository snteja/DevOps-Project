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
        
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv(credentialsId: 'sonarqube', installationName: 'sonar-server') {
                    // Optionally use a Maven environment you've configured already
                    
                        sh 'mvn clean package sonar:sonar'
                  
                }
            }
        }
    }
}
