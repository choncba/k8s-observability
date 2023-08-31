echo "Predator: http://localhost:4000"
kubectl port-forward -n predator deployment/predator 4000:80 &
echo "Grafana: http://localhost:3001" &
kubectl port-forward -n observability svc/observability-grafana 3001:80 &
echo "Taskmanager: http://localhost:5000" &
kubectl port-forward -n app svc/taskmanager 5000:80 &
echo "Odigos: http://localhost:3000" &
odigos-ui

