# Usa uma imagem oficial do Maven com OpenJDK 17 para compilar a aplicação
FROM maven:3.8.7-openjdk-17 AS builder

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos do projeto para o container
COPY . .

# Compila a aplicação com Maven, ignorando os testes
RUN mvn clean package -DskipTests

# Usa uma imagem mais leve do OpenJDK para rodar a aplicação
FROM openjdk:17-jdk-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo JAR gerado na fase de build para a imagem final
COPY --from=builder /app/target/PackNow-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta 8080
EXPOSE 8080

# Comando de entrada para rodar a aplicação
CMD ["java", "-jar", "app.jar"]
