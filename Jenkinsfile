pipline {
	agent any
	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
		stage('Build Deploy') {
			steps {
				withCredentials([usernamePassword(credentialsId: 'dockeruser', 
					usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
    			sh "docker login --username=$USERNAME --password=$PASSWORD"
    			sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER"
    			sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
    			sh "docker logout"
				}		
			}
		}
	}
}