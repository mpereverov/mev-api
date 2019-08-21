properties([
	parameters([
		string(
			defaultValue: 'mpereverov/mev-api',
			description:'',
			name: 'IMAGE_NAME',
			trim: true
		),
		// string(
		// 	defaultValue: '$env.BUILD_NUMBER',
		// 	description:'',
		// 	name: 'IMAGE_TAG',
		// 	trim: true
		// ),
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
	    			sh "echo $IMAGE_NAME:$BUILD_NUMBER"
	    			// sh "docker build -t $IMAGE_NAME:$BUILD_NUMBER ."
	    			// sh "docker push $IMAGE_NAME:$BUILD_NUMBER"
	    			sh "docker logout"
	    			// sh "docker image rmi $IMAGE_NAME:$BUILD_NUMBER"
				}
			}
		}
	}
  	post {
    	success {
	    	build job: 'Deploy API component', 
	    	parameters: [
	    	string(name: 'component_NAME', value: 'API'), 
	    	string(name: 'IMAGE_NAME', value: '${env.IMAGE_NAME}'), 
	    	string(name: 'IMAGE_TAG', value: '${env.BUILD_NUMBER}')
	    	], quietPeriod: 5, wait: false
    	}
  	}
}
