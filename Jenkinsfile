pipeline {
    agent any
    stages {
        stage('Install Docker') {
            steps {
                echo "hello"
            }
        }
         stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t my_image .'
            }
        }
        stage('Push Docker Image to ECR') {
            steps {
                sh 'sudo $(aws ecr get-login --no-include-email --region us-east-1)'
                sh 'sudo docker tag my_image 420493635762.dkr.ecr.us-east-1.amazonaws.com/final-workshop:$BUILD_NUMBER'
                sh 'sudo docker push 420493635762.dkr.ecr.us-east-1.amazonaws.com/final-workshop:$BUILD_NUMBER'
            }
        }
    }
}