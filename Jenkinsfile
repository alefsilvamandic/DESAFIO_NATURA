/*pipeline {
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
}*/

podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'git', image: 'alpine/git', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]
  ) {
    node('my-python-app-cpu') {
        stage('Check running containers') {
            container('docker') {
                // example to show you can run docker commands when you mount the socket
                sh 'hostname'
                sh 'hostname -i'
                sh 'docker ps'
            }
        }
        
        stage('Clone repository') {
            container('git') {
                sh 'whoami'
                sh 'hostname -i'
                sh 'git clone -b master https://github.com/lvthillo/hello-world-war.git'
            }
        }
    }
}