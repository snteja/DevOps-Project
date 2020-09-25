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
		sh 'docker build -t project .' 
            }
        }
		
		stage ('Docker Push')
        {
            steps
            {
		withCredentials([string(credentialsId: 'dockerhub-teja', variable: 'dockerhubpwd')]) {
		sh "docker login -u sainava225 -p ${dockerhubpwd}"
			}
		sh 'docker tag project sainava225/praveenproject-app' + ":$BUILD_NUMBER"
		sh 'docker push sainava225/praveenproject-app' + ":$BUILD_NUMBER"
			}	
        }
        
        stage ('Deploy to K8s')
        {
            steps
            {
                sshagent(['k8-ssh']) {
                    sh 'scp -o StrictHostKeyChecking=no project-service.yml pod-teja.yml snteja@192.168.0.103:/home/snteja/'
		    script{
			try{
				sh 'ssh snteja@192.168.0.103 kubectl apply -f .'
				}catch(error){
				sh 'ssh snteja@192.168.0.103 kubectl create -f .'
				}
		    }
		}
            }
            }
        }
    }
}
