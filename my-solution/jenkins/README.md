docker build . --tag alef123vinicius/jenkins:1.0.0


docker run --name jenkins -d -p 8080:8080 -v jenkins_home:/var/jenkins_home -v jenkins_backup:/srv/backup alef123vinicius/jenkins:1.0.0