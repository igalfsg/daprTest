kubectl create namespace devigsandle

helm delete firstdeployment1dev

helm install firstdeployment1dev .\k8sandhelm 
kubectl get pods -n devigsandle

#devspaces
helm delete devspaces

helm install devspaces .\k8sandhelmdevspaces 
kubectl get pods -n dev

#deploy ingress
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

helm install nginx-ingress stable/nginx-ingress --namespace devigsandle  --set controller.replicaCount=2   --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux      --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux 


kubectl get pods -n dev
