pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Maman08/cicd'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest test_app.py'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                pkill -f app.py || true
                nohup python3 app.py &
                '''
            }
        }
    }
}
