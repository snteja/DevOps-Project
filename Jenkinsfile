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
		sh 'sudo docker build -t project .' 
            }
        }
		
		stage ('Docker Push')
        {
            steps
            {
		withCredentials([string(credentialsId: 'dockerhub-teja', variable: 'dockerhubpwd')]) {
		sh "docker login -u sainava225 -p ${dockerhubpwd}"
			}
		sh 'sudo docker tag project sainava225/praveenproject-app' + ":$BUILD_NUMBER"
		sh 'sudo docker push sainava225/praveenproject-app' + ":$BUILD_NUMBER"
			}	
        }
        
        #stage ('Deploy to K8s')
        {
            steps
            {
                sshagent(['k8-ssh']) {
                    // some block
            }
            }
        }
    }
}
