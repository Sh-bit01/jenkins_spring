pipeline {
    agent any

    environment {
        // Set Java and Maven home if needed
        MAVEN_HOME = tool 'Maven 3'   // Configure in Jenkins > Global Tool Configuration
        JAVA_HOME = tool 'JDK 17'     // Configure in Jenkins
        PATH = "${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/your-spring-boot-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }

        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        // Optional deployment stage
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying to production server...'
                // Example: Copy JAR to server, or call deployment script
                // sh 'scp target/app.jar user@host:/path'
                // sh 'ssh user@host "systemctl restart app-service"'
            }
        }
    }

}

