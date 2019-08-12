pipeline {
	agent any
	stages {
		// stage('Checkout') {
		// 	steps {
		// 		checkout scm
		// 	}
		// }
		stage('Build Deploy') {
			steps {
				// sh 'sudo usermod -a -G docker jenkins'
				// sh 'docker images'
				echo "${imgNAME}:${BUILD_NUMBER}"
				// withCredentials([usernamePassword(credentialsId: 'dockeruser', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
    			// sh "docker login --username=$USERNAME --password=$PASSWORD"
    			// sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER"
    			// sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
    			// sh "docker logout"
				// }		
			}
			agent {
			    dockerfile {
			    	// label 'Jenkins'
			        filename 'Dockerfile'
			        // dir 'build'
			        // args '-t ${IMAGE_NAME}:${BUILD_NUMBER}'
			        additionalBuildArgs '-t ${imgNAME}:${BUILD_NUMBER}'
			        // additionalBuildArgs  '--build-arg IMG_NAME=${imgNAME} TAG=${BUILD_NUMBER}'
			        registryUrl 'https://docker.io/'
			        // registryCredentialsId 'dockeruser'
		    	}
			}
			
		}
	}
}