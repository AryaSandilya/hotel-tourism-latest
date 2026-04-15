pipeline {
    agent any

    tools {
        // This must match the name you gave in Manage Jenkins -> Tools
        jdk 'Java17'
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
    }
}