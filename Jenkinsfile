pipeline {
    agent {
        docker { 
          image 'mingc/android-build-box:latest' 
          args '-u root --privileged'
        }      
    }
    stages {
        stage('Test') {
            steps {
                sh 'flutter -v'
                sh 'echo pub get'
                sh 'flutter pub get'
                sh 'echo flutter test'
                sh 'flutter test'
            }
        }
    }
}
