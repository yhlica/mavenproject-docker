pipeline {
     agent any
      environment {
    registry = "yli202c/docker-test"
    registryCredential = ‘dockerhub’
      }
     tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
    }
     stages {
          stage("Build maven project") {
               steps {
                    sh 'mvn clean install'
               }
          }
          stage("Unit test") {
               steps {
                    sh "mvn test"
               }
          }

          stage("Docker build") {
               steps {
                        script {
                                 //sh 'docker build -t yli202c/mavenproject4docker:1.2 .'
                             docker.build registry+":1.2"
                               }
                       }
          }
     }
}
