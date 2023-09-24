def buildJar() {
	echo "The jar file is being packed"
	sh "mvn package"
}

def buildImage() {
	withCredentials([usernamePassword(credentialsId : 'docker', usernameVariable : 'USER', passwordVariable : 'PASS')]) {
		sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
		sh "docker build -t biggiebroo/practice:jvm-1.0 ."
		sh "docker push biggiebroo/practice:jvm-1.0"
	}
}

def deploy() {
	echo "The application has been built"
}

return this