Start-Process kubectl -ArgumentList "port-forward -n predator deployment/predator 4000:80 "
Start-Process kubectl -ArgumentList "port-forward -n observability svc/observability-grafana 3001:80"
Start-Process kubectl -ArgumentList "port-forward -n app svc/taskmanager 5000:80"
Start-Process C:\Users\u518765\odigos-ui.exe
# Start-Process kubectl -ArgumentList "port-forward -n odigos-system svc/observability-grafana 3001:80"
