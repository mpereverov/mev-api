pipeline {
	// agent any
	agent {
	    dockerfile {
	        filename 'Dockerfile'
	        // dir 'build'
	        // args '-t ${IMAGE_NAME}:${BUILD_NUMBER}'
	        // additionalBuildArgs  '--build-arg version=1.0.2'
	        // registryUrl 'https://myregistry.com/'
	        registryCredentialsId 'dockeruser'
    	}
	}
	// stages {
	// 	// stage('Checkout') {
	// 	// 	steps {
	// 	// 		checkout scm
	// 	// 	}
	// 	// }
	// 	stage('Build Deploy') {
			
	// 		steps {
	// 			echo "${IMAGE_NAME}:${BUILD_NUMBER}"
	// 			// withCredentials([usernamePassword(credentialsId: 'dockeruser', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
 //    			// sh "docker login --username=$USERNAME --password=$PASSWORD"
 //    			// sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER"
 //    			// sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
 //    			// sh "docker logout"
	// 			// }		
	// 		}
	// 	}
	// }
}