properties([parameters([choice(choices: ['master', 'teja', 'Prod', 'QA'], description: 'Select any branch to build', name: 'BRANCHES')])])

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
}
