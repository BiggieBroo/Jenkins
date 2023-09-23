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
						script "docker build -t biggiebroo/practice:jvm-2.1 ."
						script "echo ${PASS} |docker login -u ${USER} --password-stdin"
						script "docker push biggiebroo/practice:jvm-2.1"
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