pipeline {
    agent any
    stages {
        stage("Checkout"){
            steps {
                checkout scm
            }
        }
        stage("Dependency Graph Setup"){
            steps{
                sh "flutter clean";
                sh "flutter pub get"
                sh "flutter pub run build_runner build --delete-conflicting-outputs"
            }
        }
        stage('Test') {
            steps {
                sh "flutter test"
            }
        }
    }
}