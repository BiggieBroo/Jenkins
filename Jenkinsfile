library identifier: 'jenkins-shared-library@master', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github'])

pipeline {
	agent any
	// Tools
	tools {
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
					sh "mvn package"
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
					sh "echo 'It is being deployed'"
				}
			}
		} // end Deploy

	} // end stages
} // end pipeline