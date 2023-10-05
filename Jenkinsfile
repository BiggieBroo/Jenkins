#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {

	agent any

	// Tools
	tools {
		maven "Maven"
	}

	// Environment
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-1.1"
	}

	// Parameters
	parameters {
		choice(name: 'VERSION', choices: ['1.1','1.2','1.3'], description: '')
		booleanParam(name: 'EXECUTE_TEST', defaultValue: true, description: '')
	}

	stages {
		stage("Build") {
			when {
				expression {
					BRANCH_NAME == "main" || BRANCH_NAME == "master" || parameters.EXECUTE_TEST
				}
			}

			steps {
				script {
					buildJar()
				}
			}
		} // end Build

		stage("Login, Image and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Login, Image and Push

		stage("Deploy") {
			steps {
				input {
					message "Please select environment"
					ok "Done"
				}
				script {
					echo "Welcome to the deployment and your chosen environment is ${ENVIRONMENT}"
				}
			}
		} // end Deploy		
	}




}