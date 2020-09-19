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
	    stage ('Deployment to S3 bucket')
        {
            steps
            {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 's3-bucket', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
		sh  "aws s3 cp /var/lib/jenkins/workspace/Project/target/Tech*.war s3://sainava-s3"
		}
            }
        }
	    
	    stage ('Build Dockerfile')
        {
            steps
            {
		sh 'sudo docker build -t tech-data .' 
            }
        }
		
		stage ('Docker Push')
        {
            steps
            {
		withCredentials([string(credentialsId: 'dockerhub-teja', variable: 'dockerhubpwd')]) {
		sh "docker login -u sainava225 -p ${dockerhubpwd}"
			}
		sh 'sudo docker tag tech-data sainava225/tech-datarocks' + ":$BUILD_NUMBER"
		sh 'sudo docker push sainava225/tech-datarocks' + ":$BUILD_NUMBER"
			}	
        }
	    stage('Docker Run') {
           steps {
                sh 'docker run -dit --name my-app -p 9090:8080 sainava225/tech-datarocks' + ":$BUILD_NUMBER"
     }
   }
    }
}
