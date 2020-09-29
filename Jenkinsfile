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
        
    }
    post
    {
        failure
        {
            emailext attachLog: true, body: "Please go to ${env.BUILD_URL} for more details.", subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER}) has FAILED", to: 'sainavateja1@gmail.com'
        }
        success
        {
            emailext attachLog: true, body: "Please go to ${env.BUILD_URL} for more details.", subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER}) has SUCCEDED", to: 'sainavateja1@gmail.com'
        }
    }
}
