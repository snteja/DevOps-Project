#!groovy script added line changes
pipeline {	
	agent {
		docker {
			image 'ubuntu:latest'
		}
	}
    stages {	
        stage('Build') {	
            steps {	
                sh 'docker run -it --name myubuntu ubuntu'
            }	
        }	
    }	
}
