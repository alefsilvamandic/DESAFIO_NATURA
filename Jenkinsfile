pipeline {
    stage('Deploy Patient App-1') {
        steps {
            withCredentials([ string(credentialsId: 'kubernetes', variable: 'api_token') ]) {
                sh 'kubectl --token $api_token --server https://192.168.99.101:8443 --insecure-skip-tls-verify=true apply -f my-solution/s3/my-python-app-cpu.yaml '
            }
        }
    }

    stage('Deploy HPA App-1 conf') {
        steps {
            withCredentials([ string(credentialsId: 'kubernetes', variable: 'api_token') ]) {
                sh 'kubectl --token $api_token --server https://192.168.99.101:8443 --insecure-skip-tls-verify=true apply -f my-solution/s3/my-python-app-hpa.yaml '
            }
        }
    }

    stage('Deploy Patient App-2') {
        steps {
            withCredentials([ string(credentialsId: 'kubernetes', variable: 'api_token') ]) {
                sh 'kubectl --token $api_token --server https://192.168.99.101:8443 --insecure-skip-tls-verify=true apply -f my-solution/rds/my-python-app-mem.yaml '
            }
        }
    }

    stage('Deploy HPA App-2 conf') {
        steps {
            withCredentials([ string(credentialsId: 'kubernetes', variable: 'api_token') ]) {
                sh 'kubectl --token $api_token --server https://192.168.99.101:8443 --insecure-skip-tls-verify=true apply -f my-solution/rds/my-python-app-hpa.yaml '
            }
        }
    }

}