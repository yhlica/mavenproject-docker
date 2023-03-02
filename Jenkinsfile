pipeline {
     agent any
     tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
    }
     stages {
          stage("Compile") {
               steps {
                    sh 'mvn clean install'
               }
          }
          stage("Unit test") {
               steps {
                    sh "mvn test"
               }
          }
          
          stage("Package") {
               steps {
                    sh "mvn package"
               }
          }

          stage("Docker build") {
               steps {
                        script {
                                 sh 'docker build -t yli202c/repo_4_integration .'
                               }
                       }
          }
     }
}
