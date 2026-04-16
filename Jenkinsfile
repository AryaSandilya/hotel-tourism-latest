pipeline {
    agent any

    environment {
        IMAGE_NAME = "rahulraj41/tourism-app"
        TAG = "${BUILD_NUMBER}"
        CONTAINER_NAME = "tourism-container"
    }

    tools {
        jdk 'Java21'
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

        stage('Docker Build') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:$TAG .
                '''
            }
        }

        stage('Docker Push') {
            steps {
                sh '''
                docker push $IMAGE_NAME:$TAG
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                sed -i "s|image:.*|image: $IMAGE_NAME:$TAG|g" k8s/deployment.yaml
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                kubectl apply -f k8s/ingress.yaml
                kubectl rollout restart deployment tourism-deployment
                '''
            }
        }
    }
}






// pipeline {
//     agent any
//     tools{
//     jdk 'Java21'
//     }
//     environment {
//         IMAGE_NAME = "tourism-app"
//         TAG = "latest"
//         CONTAINER_NAME = "tourism-container"
//     }
//
//     stages {
//
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/AryaSandilya/hotel-tourism-latest.git'
//             }
//         }
//
//         stage('Build') {
//             steps {
//                 sh '''
//                 chmod +x gradlew
//                 ./gradlew build
//                 '''
//             }
//         }
//
//         stage('Build Docker Image') {
//             steps {
//                 sh 'docker build --no-cache -t tourism-app:latest .'
//             }
//         }
//
//         stage('Run Container') {
//             steps {
//                 sh '''
//                 docker rm -f tourism-container || true
//                 docker run -d -p 8082:8082 --name tourism-container tourism-app:latest
//                 '''
//             }
//         }
//
//
//     }
// }