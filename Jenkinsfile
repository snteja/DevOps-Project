#!One docker container per stage
pipeline {	
	agent {
		docker {
			image 'ubuntu:18.04'
		}
	}
    stages {	
        stage('Build') {	
            steps {	
                sh 'cat /etc/lsb-release'
            }	
        }	
        stage('Deploy') {	
            steps {	
                sh 'cat /etc/lsb-release'
            }	
        }			
    }	
}
