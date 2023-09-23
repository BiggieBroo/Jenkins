def gv

pipeline {

	agent any

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
					sh "mvn package"
				}
			}
		} // end build

		stage("docker") {
			steps {
				script {
					withCredentials([
					usernamePassword(credentialsId : 'docker', usernameVariable : 'USER', passwordVariable : 'PASS')
					]) {
						sh "echo docker images"
					}
				}
			}
		} // end docker

		stage("build") {
			steps {
				script {
					echo "The application has been built ..."
				}
			}
		}

	} // end stages
}