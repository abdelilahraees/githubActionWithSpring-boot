# --- Étape 1: Construction avec Maven et Java 21 ---
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Définit le dossier de travail
WORKDIR /app

# Copie l'ensemble du projet
COPY . .

# Exécute la commande Maven pour construire le JAR
RUN mvn -B package

a
# --- Étape 2: Création de l'image finale avec JRE 21 ---
FROM eclipse-temurin:21-jre

# Définit le dossier de travail
WORKDIR /app

# Copie UNIQUEMENT le fichier JAR depuis l'étape de construction
# Le nom du JAR est basé sur l'artifactId et la version de votre pom.xml
COPY --from=builder /app/target/ga-0.0.1-SNAPSHOT.jar app.jar

# Expose le port par défaut de Spring Boot
EXPOSE 8080

# Commande pour lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]