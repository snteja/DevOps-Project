#! PULL, PUSH & RUN

pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/snteja/DevOps-Project.git'
      }
    }
     stage('Docker Build') {
            steps {
                sh label: '', script: 'docker build -t sainava225/testubuntu .'
            }
        }
       stage('Docker Run') {
           agent any
           steps {
                sh 'docker run -d -it --name testubuntu sainava225/testubuntu'
     }
   }
       stage ('Docker Push')
	   {
	    steps{
		withCredentials([string(credentialsId: 'teja-dockerhub', variable: 'dockerhubpwd')]) {
    sh "docker login -u sainava225 -p ${dockerhubpwd}"
    }
	sh label: '', script: 'docker push sainava225/testubuntu'
    }
        }
    }
  }
