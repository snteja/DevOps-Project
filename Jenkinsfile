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
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpwd')]) {
                 sh "docker login -u sainava225 -p ${dockerhubpwd}"
                    }
                sh "docker push sainava225/my-image:$BUILD_NUMBER"
            }
        }
        
        stage('Run on Docker server')
        {
            steps
            {
                script{
					docker.withServer('tcp://3.14.6.238:2375') {
					docker.image('sainava225/my-image:$BUILD_NUMBER').withRun('-p 8090:8080 --name myserver201')
                }
            }
        }
	}
    }
}
