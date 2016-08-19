FROM jenkins:2.7.2

USER root 
RUN apt-get update -yqq && apt-get install -yqq apt-transport-https ca-certificates
RUN echo deb http://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/jessie-backports.list \
        && apt-get update -yqq \
        && apt-get install -yqq docker-engine \
        && rm -rf /var/lib/apt/lists/* \
        && useradd -aG docker jenkins
USER jenkins
