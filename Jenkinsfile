pipeline{
agent any
stages{
stage('Checkout'){
steps{
git  'https://github.com/AryaSandilya/hotel-tourism-latest.git'
}
}

stage('Build'){
steps{
sh  '.\gradlew.bat build'
}

}
}



}