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
                git branch: 'main', url: 'https://github.com/Sh-bit01/jenkins_spring.git'
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


   stage('Build Docker Image') {
    steps {
        sh 'docker build -t my-spring-app .'
    }
}

stage('Run App in Docker') {
    steps {
       sh  'docker rm -f my-spring-app-container || true'
	sh 'docker run -d --name my-spring-app-container -p 8888:8888 my-spring-app'

        sh 'sleep 5'
        sh 'curl http://localhost:8080'
    }
}

    }

}

