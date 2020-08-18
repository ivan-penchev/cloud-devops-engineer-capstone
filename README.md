# Udacity capstone project for [Cloud DevOps Engineer Nanodegree Program](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)
## Web application showing COVID spread statistics

### Description

Develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. Also, develop Continuous Integration steps that at least include typographical checking (aka “linting”). Implement other checks such as security scanning, performance testing, integration testing, etc. Build Docker container(s) as part of the CI/CD pipeline. Push the built container(s) to the Docker repository (AWS ECR or docker hub). Deploy Docker container(s) to a small Kubernetes cluster. For your Kubernetes cluster you can either use AWS Kubernetes as a Service, or build your own Kubernetes cluster. Deploy Kubernetes cluster, use either Ansible or Cloudformation. Preferably, run these from within Jenkins as an independent pipeline.

### Skills tested

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible or CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

### Steps outline:

- [x] **Angular app** developer by: https://github.com/ymougenel/covid19-graph
    - Statistics data source: https://github.com/CSSEGISandData/COVID-19
    - Data representation using char.js's angular wrapper: https://www.chartjs.org/ && https://valor-software.com/ng2-charts/
- [x] Docker container for the static website serving using NGINX
    - Container registry: <should insert link to dockerhub here>
- [x] Infrastructure provisioning using CouldFormation
    - Jenkins specific VPC and ES2 instance
    - EKS specific VPC, Cluster and EC2 Node instances
    - AWS user with specific permissions to execute CloudFormation script and interact with the k8s instance.
- [x] Jenkins deployment pipeline
    - Lint Dockerfile
    - Download statists data
    - Build docker image
        - Install npm packages
        - Lint application source files
        - Run application tests
        - Create production optimized build
        - Package into NGINX specific folder for static serving
    - Push docker image to the registry
    - Apply k8s deployment (yaml)
        - Application deployment
        - Load balancer service
    - Update k8s deployment with specific docker image tag
    - Wait for the pods update to finish
    - Perform post deployment sanity check
    - Prune docker generated results
- [x] Kubernetes application
    - Pod deployments using docker hub image rolling update
    - Service deployment using internal Load Balancing

