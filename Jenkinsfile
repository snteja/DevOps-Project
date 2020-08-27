properties([parameters([choice(choices: ['mastar', 'taja', 'praveen', 'quint'], description: '', name: 'branch')])])

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
