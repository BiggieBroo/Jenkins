library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: '', credentialsId: 'docker',])

pipeline {
	agent any
	// Tools
	tools {
		maven "Maven"
	}
	//Environment
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-3.0"
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
		}

	} // end stages

} // end pipeline