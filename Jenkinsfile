pipeline {
    agent any
    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }
        stage ('Flutter Packages Get') {
            steps {
                sh "flutter packages get"
            }
        }
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor"
            }
        }
        stage('Flutter Test') {
            steps {
                sh "flutter test"
            }
        }
    }
}