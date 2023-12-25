library identifier: 'jenkins-shared-library@master', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github'])

pipeline {
	agent any
	//Tools {
		maven "Maven"
	}
	// Environment
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-1.0"
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
		stage("Deploy") {
			steps {
				script {
					sh "echo 'Hello World!'"
				}
			}
		}

	} // end stages

} // end pipeline
