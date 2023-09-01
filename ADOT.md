# AWS Distro for OpenTelemetry Collector for CloudWatch en EKS

## Instalación de AWS Distro
- Instalar Certmanager en el cluster - https://docs.aws.amazon.com/es_es/eks/latest/userguide/adot-reqts.html
curl -O https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml
kubectl apply -f cert-manager.yaml
kubectl get pod -w -n cert-manager
- Habilitar permisos para Opentelemetry
kubectl apply -f https://amazon-eks.s3.amazonaws.com/docs/addons-otel-permissions.yaml
- Crear proveedor OIDC
- Crear perfiles de IAM
eksctl create iamserviceaccount --name adot-collector --namespace default --cluster eks-obs-ADOT --attach-policy-arn arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess   --attach-policy-arn arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy --approve --override-existing-serviceaccounts

- Instalar el addon ADOT
aws eks create-addon --addon-name adot --cluster-name eks-obs-ADOT