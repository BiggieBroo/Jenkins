#!/bin/bash/env groovy

library identifier: 'jenkins-shared-library@main', retriever: moderSCM([
	$class: 'GitSCMSource',
	remote: 'https://github.com/BiggieBroo/jenkins-shared-library',
	credentialsId: 'github',
])

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

 stages {

 	stage("Build Jar") {
 		steps {
 			script {
 				buildJar()
 			}
 		}
 	} // end Build Jar

 	stage("Docker Login, Building and Push") {
 		steps {
 			script {
 				dockerLogin()
 				buildDockerImage("${IMAGE_NAME}")
 				dockerPush("${IMAGE_NAME}")
 			}
 		}
 	} // end Docker Login, Building and Push

 	stage("Deploy") {
 		steps {
 			script {
 				echo "It is on the stage of the deployment"
 			}
 		}
 	} // end Deploy

 } // end stages



} // end pipeline