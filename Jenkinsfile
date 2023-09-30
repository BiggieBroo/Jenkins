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
	IMAGE_NAME="biggiebroo/practice:jvm-1.0"
}

//Stages
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

	stage("AWS") {
		steps {
			script {

				def cmdShell = "bash ./setup.sh"
				sshagent(['ec2-server-key']) {

				sh "scp docker-compose.yaml ec2-user@3.120.246.128:/home/ec2-user"
				sh "scp setup.sh ec2-user@3.120.246.128:/home/ec2-user"
				sh "ssh ec2-user@3.120.246.128 ${cmdShell}"

				} // end sshagent

			}

		}
	} // end AWS

} // end stages


} // end pipeline