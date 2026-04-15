pipeline {
    agent any

    environment {
        IMAGE_NAME = "rahulraj41/tourism-app"
        TAG = "latest"
        CONTAINER_NAME = "tourism-container"
    }

//     tools {
//         jdk 'Java21'
//     }

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
                sh '''
                docker build -t $IMAGE_NAME:$TAG .
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f $CONTAINER_NAME || true
                docker run -d -p 8082:8082 --name $CONTAINER_NAME $IMAGE_NAME:$TAG
                '''
            }
        }
    }
}