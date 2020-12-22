# Introducao 

Neste diretório contém o Dockerfile para gerar uma imagem do jenkins com alguma configurações previamente feitas.
Tambem possui os yaml para realizar deployments do jenkins no kubernetes via kubectl

# Para gerar uma iamgem do jenkins, tenha o docker instalado, login do dockerhub e execute:

docker build . --tag alef123vinicius/jenkins:1.0.0

# para criar um container de teste:

docker run --name jenkins -d -p 8080:8080 -v jenkins_home:/var/jenkins_home -v jenkins_backup:/srv/backup alef123vinicius/jenkins:1.0.0

# para realizar o criar o jenkins no kubernetes 

- obs-1: pode ser necessário exportar o KUBECONFIG para encontrar o kubectl

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f jenkins.yaml

kubectl apply -f jenkins-hpa.yaml