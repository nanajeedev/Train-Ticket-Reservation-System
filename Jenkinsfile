pipeline{
    agent any
    environment{
        registry = '399747338321.dkr.ecr.ap-south-1.amazonaws.com/traintickets'
        imagename = 'Traintickets'
    }
    stages{
        stage('Build mvn packages'){
            steps{
                sh 'mvn clean install'

            }
        }
        stage('test packages'){
            steps{
                sh 'mvn test'
            }
        }
        stage('build docker image'){
            steps{
                sh 'docker build -t traintickets:$NEW_VERSION  .'
            }
        }
        stage('login docker'){
            steps{       
            sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 399747338321.dkr.ecr.ap-south-1.amazonaws.com'
            }  
        }
        stage('tag image'){
            steps{       
            sh 'docker tag traintickets:$NEW_VERSION  399747338321.dkr.ecr.ap-south-1.amazonaws.com/traintickets:$NEW_VERSION '
            }  
        }
        stage('Push image to registry'){
            steps{       
            sh 'docker push 399747338321.dkr.ecr.ap-south-1.amazonaws.com/traintickets:$NEW_VERSION '
            }  
        }
        stage('stop pervious container'){
            steps{       
              sh 'docker ps -f name=${imagename} -q | xargs --no-run-if-empty docker container stop'
              sh 'docker container ls -a -fname=${imagename} -q | xargs -r docker container rm'
            }  
        }
        stage('Image,run as container'){
            steps{       
            sh 'docker run -itd --name ${imagename} -p 8084:8080 399747338321.dkr.ecr.ap-south-1.amazonaws.com/traintickets:$NEW_VERSION '
            }  
        }
    }
}