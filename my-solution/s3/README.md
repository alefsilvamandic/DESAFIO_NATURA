# Para fazer o deploy no kubernetes

## Pré-requisitos

Ter o cluster kubernetes instalado, kubectl, kubeadm e todos os requisitos para o cluster estar em funcionamento

Para testar a imagem do Dockerfile no docker crie a imagem e execute localmente.

Build image if not exists. Utilize seu user ou uma conta padrão para criar o build.

```
docker build -t alef123vinicius/python-app:v1 .

```

## No kubernetes

O arquivo my-python-app-cpu.yaml contém o deployment e o service para a aplicação. execute:

```
kubectl apply -f my-python-app-cpu.yaml

```

Para ativar o Horizontal Auto Scaling execute:

```
kubectl apply -f my-python-app-hpa-cpu.yaml

```

