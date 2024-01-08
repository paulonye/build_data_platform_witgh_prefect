# Building a Modern Data Platform with Prefect as the Orchestrator

The main aim of this project IS to show how you can deploy your prefect flows using best practices such as:

- Separating orchestration logic from transformation logic
- Provisioning needed infrasructure with terraform
- Using CI/CD to manage deployments to environments

There are a lot of moving pieces in this project; here are some that will be worthwhile to mention so as get the basic idea of the project flow.

## THE STACKS
We have major stacks we woule be using for this project: These are;
- Prefect: prefect is used as the orchestrator tool; this basically means it will handle the scheduling (triggering and execution), the flow of jobs (tasks we want to run), and monitoring of the jobs. Some key elements of prefects to mention here will be workpool & workers configuration, and also prefect deployments. These two will be further discussed along the line, but just to get an high level overview of them. There are a couple of ways to deploy your jobs to prefect, one way is to use workpool based deployment. A work pool-based deployment is useful when you want to dynamically scale the infrastructure where your flow code runs. Work pool-based deployments contain information about the infrastructure type and configuration for your workflow execution. One of the infrastructure options prefect makes available is to use a serverless cloud provider option such as: AWS ECS, GCP Cloud Run, Azure Container Instance.
- GCP: As mentioned in the prefect stack above, prefect makes available serverless cloud provider options, one of which is GCP Cloud Run. GCP cloud run is google serverless platform that enables you to run your code on in a docker environment. Cloud runs code using docker images, hence would need access to a docker image during execution. This is where Google Artifact Registry comes in. We would need to provision some of the needed GCP infrastruture to run our jobs.
- AWS: As outlined in the Prefect stack, Prefect offers serverless cloud provider options, and among them is AWS ECS (Elastic Container Service). AWS ECS is a fully managed container orchestration service that enables you to run Docker containers easily and securely. ECS is well-suited for scenarios where Dockerized execution is a requirement. To facilitate the deployment and execution of jobs, AWS Elastic Container Registry (ECR) is employed as the container registry for storing Docker images. Seamless access to Docker images during execution is crucial, and AWS ECR plays a central role in providing this access. Provisioning the necessary AWS infrastructure, including fargate and ECR repositories, is essential for the smooth execution of our jobs within the AWS ECS environment
- Azure: In the context of the Prefect stack, serverless cloud provider options are provided, and one of the choices is Azure Container Instances (ACI). Azure ACI is a serverless container service that simplifies the deployment of containers without requiring you to manage the infrastructure. It is an excellent choice for scenarios where the benefits of serverless container execution are preferred. To support the execution of jobs, Azure Container Registry (ACR) is employed as the designated container registry for storing Docker images. The seamless access to Docker images during execution is critical, and Azure ACR ensures the availability of these images. Provisioning the necessary Azure infrastructure, including ACI containers and ACR repositories, is vital for the effective execution of our jobs within the Azure ACI environment.
- Terraform: Terraform is an Infrastructure as Code "IAC" tool that will be used to provision some of the needed infrastructure to deploy our flows.

## FLOW OF WORK
In other to build out a fully scalable and modular data platform using prefect, we would have to plan out methodlogically how all components would fit together. Here are a series of steps to get us started.

Working on Transformation Logic:
- Clearly define the tasks that needs to be run
- Integrating prefect blocks for specific taks such as reading data from a cloud storage bucket
- Integrating prefect blocks for storing secrets

Working on Infrastructure Deployment:
- Setting up of Terraform Modules for your resources which are: Prefect WorkPools (GCP,Azure, AWS), GCP Artifact Registry, AWS Elastic Container Registry, Azure Container Registry.
- Deploying these modules to their appropraite cloud environments using CI/CD (a build and release architecture is adopted)
- Configuration of environments secrets and variables
- Building and Pushing the Docker Image to each of the cloud environments
- Create an additional CI/CD pipelinr

Working on Prefect Deployemnt (Orchestration Logic)
- Building out the yaml file for depployment
- Handling deployment configuration ~ speciying the flows and their appropraite workpools
- Creating repository secret tokens so that prefect can pull code (flows) during execution of the Job.
- Deploying the configuration to prefect cloud using CI/CD

## ARCHITECTURE DIAGRAM