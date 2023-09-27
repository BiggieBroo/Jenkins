#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM([
	$class : 'GitSCMSource',
	remote : 'https://github.com/BiggieBroo/jenkins-shared-library',
	credentialsId : 'github',

])

pipeline {

	agent any
	//Tools
	tools {
		maven "Maven"
	} // end tools

	//Environment
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-1.0"
	} // end environment

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end build jar

		stage("Build image, login and push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end build image, login and push


	} // end stages

}