az login
##add azure container registry to aks
$clustername="CLUSTERNAME"
$resourceGroupName="RGNAME"
$location="westus2"
$acrName = "devigsandleacr"
$nodes = 2
$maxNodes = 3
$vmSize = "Standard_F4s_v2"
az group create --name $resourceGroupName --location $location
#create ACR if havent create one
az acr create --resource-group $resourceGroupName --name $acrName  --sku Basic
#create AKS cluster
az aks create --resource-group $resourceGroupName  --name $clustername --node-count $nodes  --generate-ssh-keys --kubernetes-version 1.17.3 --attach-acr $acrName --enable-cluster-autoscaler --max-count $maxNodes --min-count $nodes --location $location --node-vm-size $vmSize
#sometime it fails to acl to ACR so it doesnt hurt to re-run
az aks update -n $clustername -g $resourceGroupName --attach-acr $acrName 

#add dev spaces
az aks use-dev-spaces -g $resourceGroupName -n $clustername