#! PULL, PUSH & RUN

pipeline {
  agent any
  stages {
     stage('Docker Pull') {
            steps {
                sh label: '', script: 'docker pull ubuntu:latest'
            }
        }
       stage('Docker Run') {
           steps {
                sh 'docker run -d -it --name runubuntu ubuntu'
     }
   }
       stage ('Docker Push')
	   {
	    steps{
		withCredentials([string(credentialsId: 'teja-dockerhub', variable: 'dockerhubpwd')]) {
    sh "docker login -u sainava225 -p ${dockerhubpwd}"
    }
    sh label: '', script: 'docker commit runubuntu sainava225/runubuntu' + ":$BUILD_NUMBER"
	sh label: '', script: 'docker push sainava225/runubuntu' + ":$BUILD_NUMBER"
    }
        }
    }
  }
