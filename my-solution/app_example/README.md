# deployment applications with kubectl

# deployment  aaplications with managment cpu metric

kubectl apply -f my-python-app-cpu.yaml

kubect get deployment

kubectl autoscale deployment my-python-app-cpu --cpu-percent=70 --min=1 --max=10

kubectl get hpa

metric server for vertical management

helm install --name metrics-server --namespace kube-system stable/metrics-server

kubectl apply -f my-python-app-mem.yaml

# autocale applications 

kubectl autoscale deployment my-python-app-mem --mem-percent=70 --min=1 --max=10