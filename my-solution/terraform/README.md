# Terraform para criação do cluster kubernetes

## Pré-requisitos

aws-cli

configurar as credenciais




# Provisionando a infraestrutura dos workers e master para o kubernetes

Comandos

```
terraform init

```

```
terraform plan

```

Para criar tudo que foi planejado e provisionar na aws execute:

```
terraform apply

```

Para excluir tudo que foi provisionado na aws

```
terraform destroy --force

```

# O que será criado ?

4 instancias EC2 na Amazon com a consiguração do security group com diponibilidade para acessar as instancias via ssh.
A configuração do security group não segue o padrão para ser realizado em produção, pois mais a configuração não limita portas e ip que irão acessar a instancias. Este exemplo simula um teste para criar o cluster, e para entrar em produção precisaria habilitar no security group somente as portas e endereços que são necessários para executar o ansible, update das imagens do sistema operacional e demais aplicações, além da comunicação insterna e exeterna do kluster através da sua api. A chave publica passada e criada, será utilizada para o acesso via ssh. pode-ser criar um par novo de chaves para ser utilizado. 


# Criar os loadbalancers