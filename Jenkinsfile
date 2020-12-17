#!groovy
properties([parameters([listGitBranches(branchFilter: '.*', credentialsId: '', defaultValue: '', name: 'FROM_Branch', quickFilterEnabled: false, remoteURL: 'https://github.com/snteja/DevOps-Project.git', selectedValue: 'NONE', sortMode: 'NONE', tagFilter: '*', type: 'PT_BRANCH')])])

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
