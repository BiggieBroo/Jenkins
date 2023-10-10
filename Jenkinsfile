library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class : 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {

	agent any

	// Tools
	tools {
		maven "Maven"
	}

	// Environment
	environment {
		IMAGE_NAME="biggiebroo/practice:jvm-1.0"
	}

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Build Image, Login on Docker and Push Docker Image") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // Build Image, Login on Docker and Push Docker Image

		stage("Deploy on AWS") {
			steps {
				script {
					sshagent(['ec2-server-key']) {
						sh "scp Jenkinsfile ec2-user@3.75.178.165:/home/ec2-user"
					}		
				}
			}
		} // Deploy on AWS


	}


}