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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'Deploy-s3-bucket', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
		sh  "aws s3 cp /var/lib/jenkins/workspace/dockerpipeline-app/target/* s3://sainava225-s3"
		}
            }
        }
    }
}
