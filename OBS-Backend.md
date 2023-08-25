## Instalo el Backend: Grafana+Prometheus+Tempo+Loki
helm repo add keyval-dev https://keyval-dev.github.io/charts

helm install --repo https://keyval-dev.github.io/charts observability oss-observability --namespace observability --create-namespace

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