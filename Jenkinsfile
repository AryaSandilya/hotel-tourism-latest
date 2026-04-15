pipeline {
    agent any
    tools{
    jdk 'Java21'
    }
    environment {
        IMAGE_NAME = "tourism-app"
        TAG = "latest"
        CONTAINER_NAME = "tourism-container"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AryaSandilya/hotel-tourism-latest.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                chmod +x gradlew
                ./gradlew build
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t tourism-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f tourism-container || true
                docker run -d -p 8082:8082 --name tourism-container tourism-app:latest
                '''
            }
        }
    }
}