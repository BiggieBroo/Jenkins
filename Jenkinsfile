library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {

	agent any

	// Tools
	tools {
		maven "Maven"
	}

	// Environment
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-1.0"
	}

	// Stages

	stages {

		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Docker Login, Docker Build Image and Docker Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Docker Login, Docker Build Image and Docker Push

		stage("Deploy Stage") {
			steps {
				script {
					sh "echo 'It is going to be deployed'"
				}
			}
		} // end Deploy Stage



	} // end Stages

} // end pipeline
