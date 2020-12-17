#!groovy
properties([parameters([string(defaultValue: 'origin/master', description: 'Select any branch', name: 'BRANCH', trim: false)])])

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
