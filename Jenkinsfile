#!/usr/bin/env groovy

library identifier : 'jenkins-shared-library@main', retriever : modernSCM(
	[
    $class : 'GitSCMSource',
    remote : 'https://github.com/BiggieBroo/jenkins-shared-library',
    credentialsId : '1-git'
	]
	)
def gv

pipeline {
	
	agent any

	// tools
	tools {
		maven "Maven"
	}

	stages {

		stage("init") {
			steps {
				script {
					gv = load "script.groovy"
				}
			}
		} // end init

		stage("build jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end buildjar

		stage("build image") {
			steps {
				script {
					buildImage()
				}
			}
		} // end buildImage


		stage("deploy") {
			input {
				message "Please choose one of the environments"
				ok "Done"
				parameters {
					choice(name : 'ENV', choices : ['Staging', 'Dev', 'Prod'], description : '')
				}
			}
			steps {
				script {
					gv.deploy()
					echo "Chosen environment is ${ENV}"
				}				
			}


		}

	} // end stages

}