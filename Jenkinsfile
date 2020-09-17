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
		
		stage ('Build Dockerfile')
        {
            steps
            {
		sh 'sudo docker build -t devopsrocks .' 
            }
        }
		
		stage ('Docker Tag and Push')
        {
            steps
            {
		withCredentials([string(credentialsId: 'dockerhub-teja', variable: 'dockerhubpwd')]) {
					sh "docker login -u sainava225 -p ${dockerhubpwd}"
			}
				sh 'sudo docker tag devopsrocks sainava225/project-app'
				sh 'sudo docker push sainava225/project-app'
			}	
        }	
    }
}
