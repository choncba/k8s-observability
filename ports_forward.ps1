Start-Process kubectl -ArgumentList "port-forward -n predator deployment/predator 4000:80 "
Start-Process kubectl -ArgumentList "port-forward -n observability svc/kube-prometheus-grafana 3001:80"
