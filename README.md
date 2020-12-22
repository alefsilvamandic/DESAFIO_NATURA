# Introdução

A seguinte estrutura representa a criação e instalação de um cluster kubernetes na aws, utilizando terraform, ansible, jenkins docker e duas aplicações exemplo

## Aequitetura geral

Para resolução do problema base, foram utilizadas 4 instancias da aws t3.medium. As quatro instancias compõem uma arquitetura basica para a criação de um kluster kubernetes com um nó master e três workers. As instâncias contém tags para facilitar a instalação dos pré-requisitos que cada uma precisa ter, como a tag master ou worker, que representam instalações de pacotes para configurar o nó master e os nós slaves.

- obs-1: Ao rodar o playbook do ansible um diretório será gerado na raiz do projeto chamado join. Neste diertório contem o comando do kubeadm para adicionar os workers.

Dentro deste cluster kubernetes, que pode ser configurado utilizando o playbook ansible, estará deployment do jenkins para criar o pipeline que servirá de base para o build, e publishing das aplicações, além de testes entre cada etapa.

- obs-2: O dockerfile jenkins com uma versão fixa, contém uma pré configuração e usuário padrão criados. Porém, os demais plugins e configurações devem ser feitos para criar os pipelines e conectar ao kubernetes com o kubernetes-cli e adicionando o repositório git com os arquivos para deployment.

Com o jenkins configurado eo Jenkinsfile na raiz do projeto, pode-se iniciar as etapas para o deployment da aplicação, Para o deploy em diferente ambiente, pode-se configurar mais de um namespace como QA e producao e ligar com uma stage e um test para assegurar que as modificações estão corretas, caso o ambiente de QA apresente problemas o pipeline é interrompido para não afetar a produção.

# Resolucao

## Terraform

```
$ cd terraform
```

```
$ terraform init
```

```
$ terraform plan
```

```
$ terraform apply
```

para destruir as instâncias

```
$ terraform destroy
```

## Ansible para instalar o kubernetes

Pré-requisitos:

 - python:3.x

 - pip install boto3

Após instalar o python e a biblioteca no host local entre no diretório do ansible e execute 

```
$ cd ansible
$ export AWS_ACCESS_KEY_ID='YOUR_AWS_API_KEY'
$ export AWS_SECRET_ACCESS_KEY='YOUR_AWS_API_SECRET_KEY'
```

```
$ ansible-playbook -u ubuntu -i ec2.py play_config_hosts.yml
```

## Jenkins

Após a instalação do cluster, faça o deploy do jenkins, configure o jenkins para ter acesso ao kubernetes e em seguida crie o pipeline para realizar os deploys das demais aplicações

o diretório jenkins possui:

account.yaml --> arquivo para configuração do jenkins no kubernetes para habilitar a comunicação inicial.
jenkins.yaml --> deployment e service para iniciar o jenkins, a imagem possui uma versão do dockerhub ao qual está vinculada, porem pode ser feito o build com o Dockerfile do diretório
jenkins-hpa.yaml --> configuração para auto scaling do jenkins (atenção).

pode-se utilizar o kubectl apply -f name_file.yaml para criar o deployment do jenkins e expor o serviço na porta 8080.

Baixe os plugins git, kubenetes-cli e demais plugins necessarios para configurar o cluster no jenkins e criar o pipeline.

## Aplicacoes

Duas aplicações foram criadas como exemplo do teste. As duas aplicações fazem basicamente a mesma coisa, execeto que suas configurações e gerenciamento de scaling é realizado por métricas diferentes, snedo elas cpu e memória. 

Pode-se utilizar o kubectl apply -f name_file.yaml para criar o deployment, service e o hpa das aplicaçoes

