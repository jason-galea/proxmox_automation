/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        docker {
            image("local_ansible")
        }
    }
    // agent {
    //     label("docker_agent")
    // }
    stages {
        stage('build') {
            steps {
                // sh 'mvn --version'
                // sh("pwd")
                // sh("uname -a")
                // sh("env")
                // sh("docker ps")


                sh("ansible --version")
            }
        }
    }
}
