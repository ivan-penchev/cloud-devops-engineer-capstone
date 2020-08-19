def image

pipeline {
    agent any

    stages {
	    stage('Application Lint & Test') {
            agent {
                docker { 
                    image 'python:3.7-stretch' 
                   
                }
            }
            steps {
			script {
				sh 'sudo -s'
                sh 'make setup install'
                sh 'make lint-python'
				sh 'make lint-docker'
                sh 'make lint-html'
                sh 'make test'
				}
            }
        }

		stage('Container Build') {
            steps {
                script {
                    image = docker.build("ivanspenchev/udacity-devops", "-f application-light/Dockerfile application-light")
                }
            }
        }
		stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        image.push("${env.BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }

        stage("Prune docker") {
            steps {
                sh "docker system prune -f"
            }
        }

    }
}
