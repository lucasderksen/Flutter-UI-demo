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
                sh 'flutter test'
            }
        }
    }
}
