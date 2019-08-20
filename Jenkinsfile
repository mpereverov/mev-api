properties([
	parameters([
		string(
			defaultValue: 'mpereverov/mev-api',
			description:'',
			name: 'IMAGE_NAME',
			trim: true
		),
		string(
			defaultValue: '$env.BUILD_NUMBER',
			description:'',
			name: 'IMAGE_TAG',
			trim: true
		),
	])
])


pipeline {
	agent any
	stages {
		stage('Build Push') {
			steps {
				withCredentials([usernamePassword(credentialsId: "dockeruser", 
					passwordVariable: 'docker_PASSWORD', usernameVariable: 'docker_USERNAME')]) {
					sh "docker login --username=$docker_USERNAME --password=$docker_PASSWORD"
	    			sh 'echo '$IMAGE_NAME:$IMAGE_TAG'
	    			// sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
	    			// sh "docker push $IMAGE_NAME:$IMAGE_TAG"
	    			sh "docker logout"
	    			// sh "docker image rmi $IMAGE_NAME:$IMAGE_TAG"
				}
			}
		}
	}
  	post {
    	success {
	    	build job: 'Deploy API component', 
	    	parameters: [
	    	string(name: 'component_NAME', value: 'API'), 
	    	string(name: 'IMAGE_NAME', value: '${params.IMAGE_NAME}'), 
	    	string(name: 'IMAGE_TAG', value: '${params.BUILD_NUMBER}')
	    	], quietPeriod: 3, wait: false
    	}
  	}
}
