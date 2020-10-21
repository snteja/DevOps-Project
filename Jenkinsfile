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
                sh "docker build -t sainava225/my-image:$BUILD_NUMBER ."
            }
        }
        
        stage('Push Docker Image')
        {
            steps
            {
                withCredentials([string(credentialsId: 'dockerhubcred', variable: 'dockerhubpwd')]) {
                 sh "docker login -u sainava225 -p ${dockerhubpwd}"
                    }
                sh "docker push sainava225/my-image:$BUILD_NUMBER"
            }
        }
        
        stage('Run on Docker server')
        {
            steps
            {
                sshagent(['docker-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.19.156 docker run -d -p 8090:8080 --name myserver201 sainava225/my-image:$BUILD_NUMBER"
            }
        }
    }
}
