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

		stage("AWS") {
			steps {
				script {
					def cmdShell = "bash ./setup.sh ${IMAGE_NAME}"
					sshagent(['ec2-server-key']) {
						sh "scp docker-compose.yaml ec2-user@35.156.71.149:/home/ec2-user"
						sh "scp setup.sh ec2-user@35.156.71.149"
						sh "ssh -o StrictHostKeyChecking=no ec2-user@35.156.71.149 ${cmdShell}"
					}
				}
			}
		} // end AWS


	} // end stages

}