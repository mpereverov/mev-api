pipeline {
	agent any
	stages {
		// stage('Checkout') {
		// 	steps {
		// 		checkout scm
		// 	}
		// }
		stage('Build Deploy') {
			agent {
			    dockerfile {
			        filename 'Dockerfile'
			        // dir 'build'
			        label '$IMAGE_NAME'
			        // registryUrl 'https://myregistry.com/'
			        registryCredentialsId 'dockeruser'
			    }
			}
			steps {
				// withCredentials([usernamePassword(credentialsId: 'dockeruser', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
    			// sh "docker login --username=$USERNAME --password=$PASSWORD"
    			// sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER"
    			// sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
    			// sh "docker logout"
				// }		
			}
		}
	}
}