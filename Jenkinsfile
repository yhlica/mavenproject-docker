pipeline {
     agent any
     tools {
        // Install the Maven version configured as "MAVEN3" and add it to the path.
        maven "MAVEN3"
        docker "Docker-4-Jenkins"  
    }
     stages {
          stage("Compile") {
               steps {
                    sh "mvn compile"
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
                    sh """docker build -t mavenproject4docker:${BUILD_TIMESTAMP} ."""
               }
          }

          stage("Docker login") {
               steps {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
                               usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                         sh "docker login --username $USERNAME --password $PASSWORD"
                    }
               }
          }

          stage("Docker push") {
               steps {
                    sh "docker push yhlica/mavenproject4docker:${BUILD_TIMESTAMP}"
               }
          }
          
          stage("Smoke test") {
              steps {
                  sleep 60
                  sh "chmod +x smoke-test.sh && ./smoke-test.sh"
              }
          }
     }
}
