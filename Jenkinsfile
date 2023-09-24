#!/usr/bin/env groovy

library identifier : 'jenkins-shared-library@main', retriever : modernSCM([
	$class : 'GitSCMSource',
	remote : 'https://github.com/BiggieBroo/jenkins-shared-library',
	credentialsId : 'github'
	])

pipeline {

	agent any

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
					dockerLogin()
					buildImage "biggiebroo/practice:jvm-1.0"
					dockerPush "biggiebroo/practice:jvm-1.0"
				}
			}
		} // end login, build and push


	} // end stages

}