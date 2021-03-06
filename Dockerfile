FROM jenkins:2.7.2

USER root 
RUN apt-get update -yqq && apt-get install -yqq apt-transport-https ca-certificates \
        && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb http://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/jessie-backports.list \
        && apt-get update -yqq \
        && apt-get install -yqq docker-engine \
        && rm -rf /var/lib/apt/lists/* \
        && usermod -aG docker jenkins

USER jenkins
