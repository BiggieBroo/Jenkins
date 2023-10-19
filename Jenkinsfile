library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {
	agent any

	tools {
		maven "Maven"
	} // end tools

	environment {
		IMAGE_NAME="biggiebroo/practice:jvm-1.0"
	} // end environment

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Docker Login, Build Image and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Docker Login, Build Image and Push

		stage("Deployment") {
			steps {
				script {
					sh "echo 'It has been deployed'"
				}
			}
		}

	} // end stages


} // end pipeline