#!groovy
properties([parameters([gitParameter(branch: '', branchFilter: '.*', defaultValue: 'master', description: 'Select one branch to build', name: 'Branch', quickFilterEnabled: false, selectedValue: 'NONE', sortMode: 'NONE', tagFilter: '*', type: 'PT_BRANCH')])])

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
