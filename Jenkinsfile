pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub') 
        IMAGE_NAME = "parthcomp367/maven-webapp"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/ParthComp367/Parth_Lab3.git' 
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Push Docker Image to Hub') {
            steps {
                sh "docker push ${IMAGE_NAME}"
            }
        }

        stage('Deploy Container') {
            steps {
                sh "docker run -d -p 8080:8080 --name myapp ${IMAGE_NAME}"
            }
        }
    }
}
