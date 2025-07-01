pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Maman08/cicd.git'
            }
        }

        stage('Install Backend') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Install Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Run Backend Test') {
            steps {
                dir('backend') {
                    sh 'npm test'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm run build'
                }
            }
        }

        stage('Start Backend') {
            steps {
                dir('backend') {
                    sh 'nohup npm start &'
                }
            }
        }

        stage('Show Output URL') {
            steps {
                echo 'Visit http://localhost:5000/api for backend'
                echo 'Visit http://localhost:3000 for frontend (run manually if needed)'
            }
        }
    }

    post {
        always {
            echo 'Build completed.'
        }
    }
}
