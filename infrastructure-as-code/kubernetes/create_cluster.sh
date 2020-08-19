#!/bin/bash -e

stackName=capstone-eks
clusterName=CapstoneEKSDev

aws cloudformation create-stack --stack-name $stackName \
       --template-body file://eks-cluster.yaml \
		--capabilities CAPABILITY_NAMED_IAM
echo "Waiting for stack $stack_name to deploy..."
aws cloudformation wait stack-create-complete --stack-name $stackName
sleep 10

echo "Backing up kubect config and replacing with new cluster configuration"
aws eks update-kubeconfig --name $clusterName

echo "Installing metrics-server"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

echo "Installing application ingress and services"
kubectl apply -f ./k8s.yaml

echo "Creating service account for Jenkins..."
kubectl -n default create serviceaccount jenkins-capstone
kubectl -n default create rolebinding jenkins-capstone-binding --clusterrole=cluster-admin --serviceaccount=default:jenkins-capstone

account_token_name="$(kubectl -n default get serviceaccount jenkins-capstone -o go-template --template='{{range .secrets}}{{.name}}{{"\n"}}{{end}}')"
access_token="$(kubectl -n default get secrets $account_token_name -o go-template --template '{{index .data "token"}}' | base64 -d)"

echo "A service account has been generated for you. Use the following secret text to create/update the txt secret in Jenkins:

$access_token

"

api_lb_dnsName="$(aws eks describe-cluster --name $clusterName| jq -r '.cluster.endpoint')"

echo "Find below the DNS Names to access the cluster: 

Kubernetes API url = $api_lb_dnsName
"
echo "Done."
