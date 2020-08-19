def image

pipeline {
    agent any

    stages {
        stage('Lint Dockerfile') {
            steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint ./application/Dockerfile | tee -a hadolint.txt'
                            sh '''
                                lintErrors=$(stat --printf="%s"  hadolint.txt)
                                if [ "$lintErrors" -gt "0" ]; then
                                    echo "Errors linting Dockerfile"
                                    cat hadolint.txt
                                    exit 1
                                else
                                    echo "Done linting Dockerfile"
                                fi
                            '''
                    }
                }
            }
        }

        stage('Download data frame') {
            steps {
                script {
                    dir("application") {
                        sh "chmod +x -R ${env.WORKSPACE}"
                        sh './scripts/get_data.sh'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    image = docker.build("ivanspenchev/udacity-devops", "-f application/Dockerfile application")
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
