# Ansible para instalação do cluster kubernetes de forma automatizada :)

Pagina oficial:

- https://aws.amazon.com/pt/blogs/apn/getting-started-with-ansible-and-dynamic-amazon-ec2-inventory-management/

Para iniciar crie seu diretpirio ansible e adicione os seguintes arquivos fazendo o download para realizar a execução do playbook

- wget https://raw.githubusercontent.com/ansible/ansible/stable-1.9/plugins/inventory/ec2.ini

- wget https://raw.githubusercontent.com/ansible/ansible/stable-1.9/plugins/inventory/ec2.py

exportar as variáveis para que o ansible consiga executar os passos a EC2 na conta aws corretamente

$ export AWS_ACCESS_KEY_ID='YOUR_AWS_API_KEY'
$ export AWS_SECRET_ACCESS_KEY='YOUR_AWS_API_SECRET_KEY'

do hosto que será executado o ansible devera ter o python instalado e a biblioteca boto

- pip install boto

crie as regras e tarefas que deverão ser executadas nas instancias do EC2, para facilitar tageie as instâncias 

para executar o plabook criado para este exemplo, suba as instancias do arquivo terraform com toda a configuração.
O terraform criar as instancias com as tags que são utilizadas no ansible para encontrar e configurar cada instancia
com os arquivos e configurações necessárias:

ansible-playbook -u ubuntu -i ec2.py site.yml

## para adicionar os worker é só executar o script gerado na pasta join nas instancias workers

pode-se também configurar automaticamente para executar essa ação


## exporte o kubeconfig para acessar o kuectl via terminal

export KUBECONFIG=/etc/kubernetes/admin.conf


## crie o namespaces para separar os ambientes de teste, deploy e o ambiente que ficara o jenkins

kubectl create namespace jenkins
kubectl create namespace applications_development
kubectl create namespace applications_production


kubectl get namespaces

