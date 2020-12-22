pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // builing application
                echo "building" 
                withKubeConfig([credentialsId: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IkJ5ellfZTBaZGxIVUxmN3F3Y3FHVGJZR25BZ1cyZnpRYzJ0YXNYVE5keDgifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtdG9rZW4tOGtwaGIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucyIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjA4NWFjZjdiLTRiNWItNGZjMy1iZGIwLWNlMDUzMDk4ZjYxZSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmplbmtpbnMifQ.Y1TpVFx_GqmLPVE7dFs3183NoWTUX9z6l2hUE5N6X6ZwRclxkkKTyqUaju0155H2Sw_PK3oS0ZYRrnwvb4MIwa8D9A6PUD-tXDsC0U31PixGEZ3Eh6SqQSWjw2F4-_w2bVjS47ljd_DM8gryd6_aO72nKBaoXyNaddT4agciSVz86czKRzyhWH1E1gmiKq2PIZ46HEznfObztKI3uqLqb2-ke_RVneBcZ4OrcXSZUzeko7ZZAA2GHQLPaWns8lfGSKTN5ddRbJxOJrAAVs5v_44NbV2YpVH-bfuRovP9DmCO4FcEwLdm7iJU2ZbKiV0QOheguuhGR8HJPkM9K0h1Rg',
                    caCertificate: '/home/alef/.minikube/ca.crt',
                    serverUrl: 'https://192.168.99.101:8443',
                    namespace: 'default'
                    ]) {
                        sh 'kubectl get pods'
                        }
            }
        }
        stage('Test'){
            steps {
                // testing application before updateing in cluster
                echo "testing" 
            }
        }
        stage('Deploy'){
            steps{
                // oh yeah go execute and update application
                echo "deployment" 
            }
        }
    }
}