pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // builing application
            }
        }
        stage('Test'){
            steps {
                // testing application before updateing in cluster
            }
        }
        stage('Deploy'){
            steps{
                // oh yeah go execute and update application
                withCredentials([ string(credentialsId: 'kubernetes', variable: 'api_token') ]) {
                sh 'kubectl --token $api_token --server https://192.168.99.101:8443 --insecure-skip-tls-verify=true apply -f my-solution/s3/my-python-app-cpu.yaml'
            }
            }
        }
    }
}