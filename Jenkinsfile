pipeline {
    agent any
    stages {
        stage("Checkout"){
            steps {
                checkout scm
            }
        }
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor"
            }
        }
        stage('Build Runner & Test') {
            steps {
                sh "flutter pub get"
                sh "flutter pub run build_runner build --delete-conflicting-outputs"
                sh "flutter test"
            }
        }
    }
}