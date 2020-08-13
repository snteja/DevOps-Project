#!groovy

pipeline {
  agent none
  stages {
    stage('Download') {
      steps {
        git 'https://github.com/snteja/DevOps-Project.git'
      }
}
     stage('Docker Run') {
      agent any
      steps {
        sh 'docker run -dit -p 8082:80 centos'
      }
     
    }
  }
}
