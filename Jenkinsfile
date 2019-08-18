pipeline {
	agent any
	stages {
		stage('Build Push') {
			steps {
				withCredentials([usernamePassword(credentialsId: "$CREDENTIALS_ID", 
					passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
					sh "docker login --username=$USERNAME --password=$PASSWORD"
	    			sh "docker build -t $IMAGE_NAME:$env.BUILD_NUMBER ."
	    			sh "docker push $IMAGE_NAME:$env.BUILD_NUMBER"
	    			sh "docker logout"
	    			sh "docker image rmi $IMAGE_NAME:$env.BUILD_NUMBER"
				}
			}
		}
	}
  	post {
    	success {
	    	build job: 'Deploy API component', 
		    	parameters: [string
		    	(name: 'component_NAME', value: 'api'),
		    	(name: 'project_NAME', value: 'app'),
		    	(name: 'PORTS', value: '4004:4004'),
		    	(name: 'network_NAME', value: 'mev'),
		    	], 
	    	quietPeriod: 0, wait: false
    	}
  	}
}