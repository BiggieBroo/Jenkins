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
					gv.buildApp()
				}
			}
		} // end build

		stage("docker") {
			steps {
				script {
					gv.dockerApp()
				}
			}
		} // end docker

		stage("build") {
			steps {
				script {
					gv.dockerBuild()
				}
			}
		}

	} // end stages
}