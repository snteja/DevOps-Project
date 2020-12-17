properties([parameters([choice(choices: ['master\nteja\nProd\nQA\nTEST'], description: 'Select any branch to build', name: 'BRANCHES')])])

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
