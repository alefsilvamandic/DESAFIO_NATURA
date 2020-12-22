pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // builing application
                echo "building" 
            }
        }
        stage('Test'){
            steps {
                // testing application before updateing in cluster
                echo "testing" 
            }
        }
        stage('Deploy'){
            steps{
                // oh yeah go execute and update application
                echo "deployment" 
            }
        }
    }
}