#!groovy

pipeline
{
    agent any
    stages
    {
        stage ('Download')
        {
            steps
            {
                git 'https://github.com/snteja/DevOps-Project.git'
            }
        }
        
        stage ('Build')
        {
            steps
            {
                sh label: '', script: 'mvn package'
            }
        }
        
        stage ('Deploy')
        {
            steps
            {
				sh label: '', script: 'cd target && sudo cp DevOpsRocks.war /root/apache-tomcat-8.0.27/webapps/DevOpsRocks.war'
            }
        }
    }
}
