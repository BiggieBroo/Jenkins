library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {

	agent any

	// Tools
	tools {
		maven "Maven"
	}

	// Environment
	environment {
		IMAGE_NAME="biggiebroo/practice:jvm-2.0"
	}

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Docker Login, Image Build and Push Docker") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Docker Login, Image Build and Push Docker"

		stage("AWS Deploy") {
			steps {
				script {
					sh "echo 'It has got ready!'"
				}
			}
		} // end AWS Deploy


	} // end stages

}