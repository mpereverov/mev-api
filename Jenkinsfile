pipeline {
	agent any
	stages {
		stage('Build Deploy') {
			steps {
				withCredentials([usernamePassword(credentialsId: $CREDENTIALS_ID, passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
					echo "$CREDENTIALS_ID"
					sh "docker login --username=$USERNAME --password=$PASSWORD"
	    			sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER ."
	    			sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
	    			sh "docker image rmi $IMAGE_NAME:$BUILD_NUMBER"
	    			sh "docker logout"
				}
			}
		}
	}
}