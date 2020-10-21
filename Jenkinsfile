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
                withCredentials([string(credentialsId: 'dockerhub-teja', variable: 'dockerhubpasswd')]) {
                 sh "docker login -u sainava225 -p ${dockerhubpasswd}"
                    }
                sh "docker push sainava225/my-image:$BUILD_NUMBER"
            }
        }
        
        stage('Run on Docker server')
        {
            steps
            {
                script{
                def dockerRun = sh "docker run -d -p 8090:8080 --name myserver201 sainava225/my-image:$BUILD_NUMBER"
                    sshagent(['dockerserver-cred']) {
                    sh "ssh -o StrictHostKeyChecking=no teja@18.222.93.117 ${dockerRun}"
                    }
                }
            }
        }
    }
}
