pipeline {
  agent any
  stages {
    stage('build-demo') {
      steps {
        sh 'go build main.go'
      }
    }
    stage('test') {
      steps {
        sh 'echo "stage test"'
      }
    }
  }
}