pipeline{
agent any
stages{
stage('Checkout'){
steps{
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