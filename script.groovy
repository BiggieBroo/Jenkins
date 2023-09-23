def buildApp() {
	sh "mvn package"
}

def dockerApp() {

withCredentials([
	usernamePassword(credentialsId : 'docker', usernamePassword : 'USER', passwordVariable : 'PASS')
	]) {
		sh "docker build -t biggiebroo/practice:jvm-1.3 ."
		sh "docker login -u ${USER} -p ${PASS}"
		sh "docker push biggiebroo/practice:jvm-1.3"
}

}

def dockerBuild() {
	echo "The image has been uploaded on the system"
}

return this