/* Requires the Docker Pipeline plugin */
pipeline {
    // agent {
    //     docker {
    //         // image("quay.io/ansible/awx-ee") // 2.12GB?????
    //         image("geerlingguy/docker-debian12-ansible") // 1.05GB, not AS bad lol
    //     }
    // }
    // agent {
    //     label("docker_agent")
    // }
    agent {
        label("jenkins")
    }
    stages {
        stage('build') {
            steps {
                sh("env")
                sh("uname -a")
                sh("pwd")
                sh("ls -lha")

                sh("""
                    docker run --rm \
                        geerlingguy/docker-debian12-ansible \
                            ansible --version
                """)

                // sh("git clone ")
            }
        }
    }
}
