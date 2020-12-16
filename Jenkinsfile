pipeline
{
    agent any
    stages
    {
        stage ('Checkout')
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
                sh 'mvn package'
            }
        }
    }
    
    post
        {
            success
            {
                slackSend channel: '#jenkins_builds', color: 'good', message: "Build status: ${env.JOB_NAME} ${env.BUILD_NUMBER} is success. Please go to ${env.BUILD_URL} for more details.", teamDomain: 'devops-n4o9126', tokenCredentialId: 'slack_token'
            }
            failure
            {
                slackSend channel: '#jenkins_builds', color: 'red', message: "Build status: ${env.JOB_NAME} ${env.BUILD_NUMBER} has failed. Please go to ${env.BUILD_URL} for more details.", teamDomain: 'devops-n4o9126', tokenCredentialId: 'slack_token'
            }
        }
}
