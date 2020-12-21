
# Jenkins for pipeline deployments in kubernetes

```
docker build . --tag alef123vinicius/jenkins-kubernetes:1.0.0

```

# rodar a aplicacao como um container doker

```
docker run -d --name jenkins-kubernetes -p 8080:8080 -v jenkins_home_1:/var/jenkins_home -v jenkins_backup_1:/srv/backup alef123vinicius/jenkins-kubernetes:1.0.0

```