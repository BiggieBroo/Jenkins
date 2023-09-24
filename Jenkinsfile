#!/usr/bin/env groovy

library identifier : 'jenkins-shared-library@main', retriever : modernSCM(
	[
    $class : 'GitSCMSource',
    remote : 'https://github.com/BiggieBroo/jenkins-shared-library',
    credentialsId : '1-git'
	]
	)



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
		} // end buildjar


	} // end stages

}