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
                sh "echo done"
            }
        }
    }
}