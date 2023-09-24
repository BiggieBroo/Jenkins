#!/usr/bin/env groovy

library identifier : 'jenkins-shared-library@master', retriever : modernSCM([
	$class : 'GitSCMSource',
	remote : 'https://github.com/BiggieBroo/jenkins-shared-library',
	credentialsId : 'github'
	])

pipeline {

	agent any

	// tools

	tools {
		maven "Maven"
	}

	stages {

		stage("build jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end build jar

		stage("login, build and push") {
			steps {
				script {
					buildDockerImage 'biggiebroo/practice:jvm-1.0'
					dockerLogin()					
					dockerPush 'biggiebroo/practice:jvm-1.0'
				}
			}
		} // end login, build and push


	} // end stages

}