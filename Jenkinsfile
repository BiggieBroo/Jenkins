library identifier: 'jenkins-shared-library@main', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github',])

pipeline {
	agent any
	tools {
		maven "Maven"
	}
	environment {
		IMAGE_NAME="biggiebroo:jvm-1.2"
	}

	stages {


		stage("Build Jar") {
			steps {
				script {
					buildJar()
				}
			}
		} // end Build Jar

		stage("Login, Build and Push") {
			steps {
				script {
					dockerLogin()
					buildDockerImage("${IMAGE_NAME}")
					dockerPush("${IMAGE_NAME}")
				}
			}
		} // end Login, Build and Push

		stage("Deploy on AWS") {
			steps {
				script {
					sh "echo 'It has been deployed with a success!'"
				}
			}
		} // end Deploy on AWS




	} // stages


}