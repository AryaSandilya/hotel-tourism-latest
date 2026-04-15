pipeline{
agent any
environment {
        // Force the build to use the container's pre-installed Java 21
        JAVA_HOME = "/opt/java/openjdk"
        PATH = "${JAVA_HOME}/bin:${PATH}"
    }
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