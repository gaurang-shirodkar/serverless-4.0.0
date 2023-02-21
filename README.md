# serverless-4.0.0

Architecture
The Sysdig serverless agent provides runtime detection through policy enforcement with Falco. At this time, the serverless agent is available for AWS Fargate on ECS. It is comprised of an orchestrator agent and (potentially multiple) workload agents.

The Sysdig serverless orchestrator agent is a collection point installed on each VPC to collect data from the serverless workload agent(s) and to forward them to the Sysdig backend. It also syncs the Falco runtime policies and rules to the workload agent(s) from the Sysdig backend.

The Sysdig serverless workload agent is installed in each task and requires network access to communicate with the orchestrator agent.

Note that the workload agent is designed to secure your workload. However, at deployment, the default setting prioritizes availability over security, using setting that allow your workload to start even if policies are not in place. If you prefer to prioritize security over availability, you can change these settings by configuring your workload starting policy.

Prerequisites
Before starting the installation, ensure that you have the following:

On AWS Side
A custom Terraform/CloudFormation template containing the Fargate task definitions that you want to instrument through the Sysdig Serverless Agent
Two VPC subnets in different availability zones that can connect with the internet via a NAT gateway or an internet gateway
On Sysdig Side
Sysdig Secure up and running

The endpoint of the Sysdig Collector for your region

From the Sysdig Secure UI, retrieve the following:

Access Key to install the agent and push the data to the Sysdig platform

Secure API Token to configure the Sysdig provider.

Known Limitations
Pulling Workload Images from Public vs Private registries
Sysdig instruments a target workload by patching its TaskDefinition to run the original workload below Sysdig instrumentation. To patch the TaskDefinition, the Sysdig instrumentation service pulls and analyzes the workload image to get the original entrypoint and the command, along with other information.

If your workload image is hosted in a private registry: you must explicitly define the entrypoint and the command in the ContainerDefinition in the template. Otherwise, the Sysdig instrumentation might not be able to collect such information and the instrumentation might fail.
If your workload image is hosted in a public registry: no additional operations are required
