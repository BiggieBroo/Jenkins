def buildApp() {
	sh "mvn package"
}

def imageApp() {
	sh "docker build -t biggiebroo/practice:jvm-1.2 ."
}

def pushApp() {
	withCredentials([
	usernamePassword(credentialsID : 'docker', usernameVariable : 'USERNAME',  passwordVariable : 'PASSWORD')
	]) {
		sh "echo ${PASSWORD} | docker login - u ${USERNAME} --password-stding"
		sh "docker push biggiebroo/practice:jvm-1.2"
	}
}