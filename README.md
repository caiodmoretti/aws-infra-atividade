Aqui está uma versão atualizada do seu `README.md` com as alterações solicitadas:

---

## Projeto da Disciplina BSI AWS - 2024.2

> Autor: Caio Dutra Moretti - Instituto Federal Fluminense (IFF)

<p align="left">
  <img src="https://user-images.githubusercontent.com/102165296/280130142-e467dc59-7f36-4c4f-9a4a-8d4d90e205f2.jpg" width="125px" />
</p>

## Sobre o Projeto
Este repositório contém o código-fonte necessário para a implementação de uma aplicação usando a AWS, desenvolvida como parte da disciplina **BSI AWS 2024.2**.

A aplicação utiliza **Docker** e **Docker Compose** para facilitar a implantação e configuração do ambiente.

## Passos Realizados

### 1. Criação do Security Group
- Criei um Security Group na AWS para permitir o tráfego HTTP (porta 80), SSH (porta 22) e acesso ao banco de dados (porta 5432).
- Configurações do Security Group:
  - **HTTP**: Porta 80 aberta para `0.0.0.0/0`.
  - **SSH**: Porta 22 aberta para `0.0.0.0/0`.
  - **PostgreSQL**: Porta 5432 aberta para o IP da instância EC2.

![Configuração do Security Group](https://raw.githubusercontent.com/caiodmoretti/aws-infra-atividade/main/Docs/Imgs/security_group.PNG?raw=true)

### 2. Criação do Par de Chaves para Acesso SSH
- Gerei um par de chaves SSH (`key.pem`) para acessar a instância EC2 via SSH.
- A chave foi baixada e configurada com permissões adequadas (`chmod 400 key.pem`).

### 3. Criação do RDS (PostgreSQL)
- Criei uma instância do Amazon RDS com PostgreSQL para servir como banco de dados da aplicação.
- Configurações do RDS:
  - **Engine**: PostgreSQL.
  - **Instance Class**: db.t3.micro.
  - **Storage**: 20 GB.
  - **Security Group**: Associado ao Security Group criado anteriormente.

![Configuração do Security Group](https://raw.githubusercontent.com/caiodmoretti/aws-infra-atividade/refs/heads/main/Docs/Imgs/rds.PNG?raw=true)


### 4. Criação da Instância EC2
- Criei uma instância EC2 com Amazon Linux 2.
- Associei o Security Group criado anteriormente e o par de chaves SSH.
- Configurações da EC2:
  - **Instance Type**: t2.micro.
  - **Storage**: 8 GB.
  - **Security Group**: Associado ao Security Group criado anteriormente.

![Configuração do Security Group](https://raw.githubusercontent.com/caiodmoretti/aws-infra-atividade/refs/heads/main/Docs/Imgs/ec2_1.PNG?raw=true)
![Configuração do Security Group](https://raw.githubusercontent.com/caiodmoretti/aws-infra-atividade/refs/heads/main/Docs/Imgs/ec2_2.PNG?raw=true)

### 5. Acesso à Instância EC2 via SSH
- Acessei a instância EC2 usando o MobaXterm e o par de chaves SSH (`key.pem`).

### 6. Clone do Repositório e Execução dos Containers
- Clonei o repositório da aplicação na instância EC2:
  ```bash
  git clone https://github.com/caiodmoretti/packnow-aws.git
  cd packnow-aws
  ```
- Subi os containers usando Docker Compose:
  ```bash
  docker-compose up --build -d
  ```

## Instalação e Execução
Para rodar o container da aplicação, siga os passos abaixo:

1. Certifique-se de ter o **Docker** e **Docker Compose** instalados em sua máquina.
2. Clone este repositório:

   ```shell
   git clone https://github.com/caiodmoretti/packnow-aws.git
   cd packnow-aws
   ```

3. Inicie os containers utilizando o Docker Compose:

   ```shell
   docker-compose up -d
   ```

4. A aplicação estará disponível na porta configurada no `docker-compose.yml`.
