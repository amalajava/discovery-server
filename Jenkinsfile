pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t discoveryserver:latest .' 
                sh 'docker tag discoveryserver dockerlearing/discoveryserver:latest'
                sh 'docker tag discoveryserver dockerlearing/discoveryserver:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          sh  'docker push dockerlearing/discoveryserver:latest'
          sh  'docker push dockerlearing/discoveryserver:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                sh "docker run -d -p 4030:80 dockerlearing/discoveryserver"
 
            }
        }
}
