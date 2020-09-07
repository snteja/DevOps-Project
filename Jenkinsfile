#! groovy script
properties([parameters([choice(choices: ['master', 'teja', 'Prod', 'QA'], description: '', name: 'branch')])])

pipeline
{
    agent any
    stages
    {
        stage ('checkout')
        {
            steps
            {
                echo "Pull code from branch teja ${params.branch}"
                git url: 'https://github.com/snteja/DevOps-Project.git', branch: "${params.branch}"
            }
        }
    }
}
