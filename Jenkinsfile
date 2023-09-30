#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@master', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

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
			echo "So far this step is going to be stopped for a while"
		}
	} // end AWS

} // end stages


} // end pipeline