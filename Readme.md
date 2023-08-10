VER https://medium.com/@edeNFed/how-to-build-an-end-to-end-open-source-observability-solution-on-kubernetes-c8725c016dd5

## Instalo el Backend
helm repo add keyval-dev https://keyval-dev.github.io/charts

helm install --repo https://keyval-dev.github.io/charts observability oss-observability --namespace observability --create-namespace

## Instalo Odigos   
helm repo add odigos https://keyval-dev.github.io/odigos-charts/

helm install my-odigos odigos/odigos --namespace odigos-system --create-namespace

## Desplegar app
- Crear namespace
kubectl create namespace app
- Copiar imagen local a minikube
minikube image load registry.gitlab.com/telecom-argentina/coo/flow/op/taskmanager-flow:opentelemetry-auto_947572262
- Desplegar app
kubectl apply -k app/taskmanager/ -n app

## Instrumentar
- Ir a Odigos
kubectl port-forward svc/odigos-ui 3000:3000 -n odigos-system

http://localhost:3000

- Seleccionar el namespace app
- Seleccioanar los destinos

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

* Password
kubectl get secret -n observability observability-grafana -o jsonpath=”{.data.admin-password}” | base64 --decode
