# daprTest
Quick performance test on Dapr

## To Deploy
1) Create your Azure resources with Scripts->CreateAzureResource.ps1 (Modify the variables to match the names you want)
2) Set up Dapr in your Cluster with DaprSetup.ps1
3) Complie and push your images using CreateAndPushContainers.ps1 (Make Sure to change your ACR name to match your own and the versioning in this file and in the values file of the chart)
4) Setup your ingress by running IngressSetup.ps1 and the ingress part of deployChart.ps1
3) Create your namespace and deploy the chart using deployChart.ps1

## Contribute
Feel free to do a PR :)
