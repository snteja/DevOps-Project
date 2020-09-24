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
                sh label: '', script: 'mvn packages'
            }
        }
        
    }
    post
    {
        failure
        {
            mail bcc: '', body: "Please go to ${env.BUILD_URL} for more details.", cc: '', from: '', replyTo: '', subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER}) has FAILED", to: 'sainavateja1@gmail.com'
            emailext attachLog: true, body: '', subject: '', to: 'sainavateja1@gmail.com'
        }
    }
}
