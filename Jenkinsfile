properties([
	parameters([
		string(
			defaultValue: 'mpereverov/mev-API',
			desription:'',
			name: 'IMAGE_NAME',
			trim: true
		),
		string(
			defaultValue: '$env.BUILD_NUMBER',
			desription:'',
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
				withCredentials([usernamePassword(credentialsId: "$CREDENTIALS_ID", 
					passwordVariable: 'docker_PASSWORD', usernameVariable: 'docker_USERNAME')]) {
					sh "docker login --username=$docker_USERNAME --password=$docker_PASSWORD"
	    			sh "echo $IMAGE_NAME:$env.BUILD_NUMBER"
	    			// sh "docker build -t $IMAGE_NAME:$env.BUILD_NUMBER ."
	    			// sh "docker push $IMAGE_NAME:$env.BUILD_NUMBER"
	    			sh "docker logout"
	    			// sh "docker image rmi $IMAGE_NAME:$env.BUILD_NUMBER"
				}
			}
		}
	}
  	// post {
   //  	success {
   //  		withCredentials([sshUserPrivateKey(credentialsId: 'aws_id_key', 
   //  			keyFileVariable: 'KEY', passphraseVariable: 'PASSPHRASE', 
   //  			usernameVariable: 'USERNAME')]) {
	  //   	build job: 'Deploy API component', 
		 //    	parameters: [
			//     	string(name: 'component_NAME', value: 'api'),
			//     	string(name: 'project_NAME', value: 'app'),
			//     	string(name: 'PORTS', value: '4004:4004'),
			//     	string(name: 'network_NAME', value: 'mev'),
			//     	string(name: 'docker_USERNAME', value: '$docker_USERNAME'),
			//     	string(name: 'docker_PASSWORD', value: '$docker_PASSWORD')
		 //    	], 
	  //   	quietPeriod: 0, wait: false
	  //   	}
   //  	}
  	// }
}
