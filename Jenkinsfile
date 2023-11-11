library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsID: 'github'])

pipeline {
	agent any
	//Tools
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
					buildJar()
				}
			}
		} // end Build Jar

		stage("Docker Login, Build and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Docker Login, Build and Push

		stage("Deploy") {
			steps {
				script {
					sh "echo 'Deploy'"
				}
			}
		} // end Deploy

	}
} // end pipeline