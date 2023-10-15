library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library@main', credentialsId: 'github',])

pipeline {
	agent any
	
	tools {
		maven "Maven"
	}

	environment {
		IMAGE_NAME="biggiebroo/practice:jvm-3"
	}

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Login, Build and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Login, Build and Push

		stage("AWS") {
			steps {
				script {
					echo "It has been deployed"
				}
			}
		} // end AWS


	} // end stages

}