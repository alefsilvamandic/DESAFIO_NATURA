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

node {

    checkout scm

    // Pega o commit id para ser usado de tag (versionamento) na imagem
    sh "git rev-parse --short HEAD > commit-id"
    tag = readFile('commit-id').replace("\n", "").replace("\r", "")
    
    // configura o nome da aplicação, o endereço do repositório e o nome da imagem com a versão
    appName = "python-app"
    registryHost = "alef123vinicius/"
    imageName = "${registryHost}${appName}:${tag}"
    
    // Configuramos os estágios
    
    stage "Build"

        def customImage = docker.build("${imageName}", "./s3/")

    stage "Push"

        customImage.push()


    stage "Deploy PROD"

        input "Deploy to PROD?"
        customImage.push('latest')
        sh "kubectl apply -f https://raw.githubusercontent.com/cirolini/Docker-Flask-uWSGI/master/k8s_app.yaml"
        sh "kubectl set image deployment app app=${imageName} --record"
        sh "kubectl rollout status deployment/app"
}
