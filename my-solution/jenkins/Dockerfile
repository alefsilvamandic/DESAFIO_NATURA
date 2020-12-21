FROM jenkins/jenkins:2.271
USER root
RUN apt-get update && apt-get install -y make git openjdk-8-jdk
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
RUN echo 2.271 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo 2.271 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home