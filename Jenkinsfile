#!groovy

pipeline
{
    try {
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
    }
    catch (err) {
        echo "Caught: ${err}"
        currentBuild.result = 'FAILURE'
        emailext attachLog: true, body: "Please go to ${env.BUILD_URL} for more details.", subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER})", to: 'sainavateja1@gmail.com'
}
