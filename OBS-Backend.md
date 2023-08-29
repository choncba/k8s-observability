# Opcion 1
## Instalo el Backend: Grafana+Prometheus+Tempo+Loki
helm repo add keyval-dev https://keyval-dev.github.io/charts

helm install --repo https://keyval-dev.github.io/charts observability oss-observability --namespace observability --create-namespace

*** Deploy en AWS EKS sin persistence volumes ***
- fetch del repo original para extraer el chart
- modificar el values.yaml de prometheus poniendo los PV en false
- Deployar con 
helm install observability oss-observability --values ./oss-observability/values.yaml


### Tempo
Name: tempo (you can choose any name you would like)
URL: http://observability-tempo.observability

### Prometheus

Name: prometheus
URL: http://observability-prometheus-server.observability

### Loki
Name: loki
URL: http://observability-loki.observability

- Ir a Grafana

kubectl port-forward svc/observability-grafana -n observability 3030:80

http://localhost:3030

* Password
kubectl get secret -n observability observability-grafana -o jsonpath='{.data.admin-password}' | base64 --decode

O buscarlo en el configmap

# Opcion 2 - Todo separado con Helm
https://dev.to/thenjdevopsguy/implementing-open-source-monitoring-and-observability-in-kubernetes-1bgn

## Grafana + Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install -n observability kube-prometheus prometheus-community/kube-prometheus-stack --create-namespace

* Acceso a Grafana
kubectl port-forward -n observability svc/kube-prometheus-grafana :80
Username: admin
Password: prom-operator

## Tempo
helm install tempo grafana/tempo-distributed -n observability

## Loki
helm install loki grafana/loki -n observability

