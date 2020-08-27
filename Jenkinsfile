properties([parameters([choice(choices: ['master', 'teja', 'QA', 'Prod'], description: '', name: 'branch')])])

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
