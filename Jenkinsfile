pipeline {
    agent any

    environment {
        VAULT_ADDR = 'http://34.245.111.118:8200'
        VAULT_TOKEN = credentials('VAULT_TOKEN') // this must match exactly in Jenkins Credentials
    }

    stages {
        stage('Get AWS Credentials from Vault') {
            steps {
                sh '''
                    echo "[*] Fetching temporary AWS credentials from Vault..."
                    CREDS=$(VAULT_ADDR=$VAULT_ADDR VAULT_TOKEN=$VAULT_TOKEN vault read -format=json aws/creds/my-role)

                    export AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r .data.access_key)
                    export AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r .data.secret_key)
                    export AWS_SESSION_TOKEN=$(echo $CREDS | jq -r .data.security_token)

                    echo "[*] Verifying AWS Identity..."
                    aws sts get-caller-identity
                '''
            }
        }
    }
}
