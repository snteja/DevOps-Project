pipeline
{
    agent any
    stages
    {
        stage('Checkout')
        {
            steps
            {
                git 'https://github.com/snteja/DevOps-Project.git'
            }
        }
        
        stage('Build')
        {
            steps
            {
                sh 'mvn clean package'
            }
        }
        
        stage('Create Docker Image')
        {
            steps
            {
                sh "docker build -t sainava225/images:$BUILD_NUMBER ."
            }
        }
        
        stage('Push Docker Image')
        {
            steps
            {
                withCredentials([string(credentialsId: 'dockerhubcred', variable: 'dockerhubpwd')]) {
                 sh "docker login -u sainava225 -p ${dockerhubpwd}"
                    }
                sh "docker push sainava225/images:$BUILD_NUMBER"
            }
        }
        
        stage('Run on Docker server')
        {
            steps
            {
                    sh "ssh snteja@138.68.30.85 sudo docker run -d -p 8080:8080 --name myserver sainava225/images:$BUILD_NUMBER"
            }
        }
    }
}
