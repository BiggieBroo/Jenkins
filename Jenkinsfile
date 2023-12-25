library identifier: 'jenkins-shared-library@master', retriever: modernSCM([$class: 'GitSCMSource', remote: 'https://github.com/BiggieBroo/jenkins-shared-library', credentialsId: 'github'])

pipeline {

	agent any
	tools {
		maven "Maven"
	}
	environment {
		IMAGE_NAME = "biggiebroo/practice:jvm-1.0"
	}

	stages {

		stage("Build Jar") {
			steps {
				script {
					sh "mvn package"
				}
			}
		} // end Build Jar

		stage("Login, Build and Push") {
			steps {
				script {
					withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
						sh "echo $PASS | docker login -u $USER --password-stdin"
						sh "docker build -t ${IMAGE_NAME} ."
						sh "docker push ${IMAGE_NAME}"
					}
				}
			}
		} // end Login, Build and Push

		stage("Deploy") {
			steps {
				script {
					sh "echo 'Deploy'"
				}
			}
		} // end Deploy
	
	}

}