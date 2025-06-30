pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Maman08/cicd'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'  // or npm install for Node
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest tests/' || true  // use `true` if no tests yet
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "🚀 Deployed Successfully!"'
            }
        }
    }
}
