pipeline {
	agent any
	stages {
		stage('Build Deploy') {
			steps {
				withCredentials([usernamePassword(credentialsId: "$CREDENTIALS_ID", passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
					sh "docker login --username=$USERNAME --password=$PASSWORD"
	    			sh "docker build -t $IMAGE_NAME:$env.BUILD_NUMBER ."
	    			sh "docker push $IMAGE_NAME:$env.BUILD_NUMBER"
	    			sh "docker image rmi $IMAGE_NAME:$env.BUILD_NUMBER"
	    			sh "docker logout"
				}
			}
		}
	}
}