pipeline{

	agent any
	

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        PATH = "/users/bripush/apache-maven-3.6.3/bin:$PATH"

	}

	stages {
	   stage("Git Checkout"){
            steps{
                git credentialsId: 'github', url: 'https://github.com/amalajava/discovery-server.git'
            }
        }
	    
        stage("Maven Build"){
            steps{
                sh 'mvn clean install'
            }
        }
       
		stage('Build') {

			steps {
				sh 'docker build -t dockerlearing/discoveryserver:0.0.1 .'
			}
		}

	    stage('Upload Image to DockerHub'){
	        steps{
            	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
              //  sh 'docker push dockerlearing/discoveryserver:0.0.1'
            }
         }
          stage('Deploy-Dev'){
              steps{
                sh "docker run -d -p 8761:8761 --name discoveryserver dockerlearing/discoveryserver:0.0.1"

              }
          }
	}

/*	post {
		always {
			sh 'docker logout'
		}
	}*/

}