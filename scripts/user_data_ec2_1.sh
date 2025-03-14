#!/bin/bash

# Instalar Docker e Git
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user
id ec2-user ssm-user
sudo newgrp docker

# Ativar docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Instalar Docker Compose 2
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Instalar Java (OpenJDK 17)
sudo yum install java-17-openjdk-devel -y

# Verificar a instalação do Java
java -version

# Definir variaveis de ambiente para o Java
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk" | sudo tee -a /etc/profile.d/java.sh
echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a /etc/profile.d/java.sh
source /etc/profile.d/java.sh

# Instalar Maven
sudo yum install maven -y

# Verificar a instalação do Maven
mvn -v

# Instalar Spring Boot CLI
sudo curl -s https://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install springboot

# Verificar a instalacao do Spring Boot
spring --version