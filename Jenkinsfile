pipeline {
    agent any
    parameters {
        string(name: 'REPO_URL', defaultValue: 'https://github.com/<your-user>/iot-gateway.git', description: 'iot-gateway repo URL')
    }
    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: "${params.REPO_URL}"
                sh 'git log --oneline -n 5 && git tag'
            }
        }
        stage('IoT Verification') {
            steps {
                sh '''
                  test -f mqtt.conf || { echo "mqtt.conf missing"; exit 1; }
                  grep -q "^PORT=1883$" mqtt.conf && echo "MQTT broker port verified: 1883"
                '''
            }
        }
        stage('Image Packaging') {
            steps {
                sh 'docker build -t iot-hub:latest .'
                sh 'docker images iot-hub'
            }
        }
    }
    post {
        success { echo 'IoT gateway pipeline completed successfully' }
        failure { echo 'IoT gateway pipeline failed' }
    }
}
