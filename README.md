<p align="center">
  <a href="" rel="noopener">
 <img width=350px height=100px src="https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg" alt="Terraform logo"></a>
</p>

<p align="center">"Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure."</p>

<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

# Terraform 101
This repository creates the following resources on AWS: IAM User Groups, Roles, Policies and Attachments; S3 buckets; Glue Crawler and Athena. It also builds and tests what's been createad with a Github Actions workflow. 

## Table of Contents

- [.github/workflows](https://github.com/anneglienke/terraform101/tree/main/.github/workflows) - Github Actions workflow
- [infrastructure](https://github.com/anneglienke/terraform101/tree/main/infrastructure) - Terraform files

## How to use Terraform

The Github Actions worflow in this repository will initialize, validate and build a plan to this Terraform project. To run it successfully, you have to insert your AWS Security Credentials (Access Key ID and Secret Access Key) in Github Secrets. This workflow won't deploy anything to your AWS account, don't worry. If you want it to, though, you can simply add step 5 (below) to it.

But you can also run Terraform and test your code locally, if you want. Just put your AWS Credentials in the file called `provider.tf` and then follow these steps:

1. [Install Terraform](https:/learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)


2. Initialize Terraform in your repository using the command `terraform init`. You should see this message:

<p align="left">
  <a href="" rel="noopener">
 <img width=470px height=120px src="https://user-images.githubusercontent.com/42218088/125295964-2bd5cd00-e2fc-11eb-8bc8-2965e697f2b8.png"></a>
</p>


3. Then you have to validate what you've created using the command `terraform validate`. If your code is valid, it will show:

<p align="left">
  <a href="" rel="noopener">
 <img width=270px height=20px src="https://user-images.githubusercontent.com/42218088/125296018-3bedac80-e2fc-11eb-9a7c-4efee6dfd0d4.png"></a>
</p>


4. After that, you can build a plan and see everything Terraform is going to deploy using the command `terraform plan`.

<p align="left">
  <a href="" rel="noopener">
 <img width=450px height=75px src="https://user-images.githubusercontent.com/42218088/125296049-4445e780-e2fc-11eb-95b7-ceef29b13c63.png"></a>
</p>


5. Finally, to deploy your infrastructure to your cloud provider (in this case, AWS), use the command `terraform apply -auto-approve`.

<p align="left">
  <a href="" rel="noopener">
 <img width=400px height=20px  src="https://user-images.githubusercontent.com/42218088/125296080-4b6cf580-e2fc-11eb-8929-d758de74475c.png"></a>
</p>


6. If this is just a test and you want to delete everything you've created, you don't have to it manually. You can simply use the command `terraform destroy`. Type 'yes' to confirm the deletion.

<p align="left">
  <a href="" rel="noopener">
 <img width=360px height=90px src="https://user-images.githubusercontent.com/42218088/125296106-53c53080-e2fc-11eb-8d9c-5acdc4915cfd.png"></a>
</p>


When the deletion is completed, you'll see this message:

<p align="left">
  <a href="" rel="noopener">
 <img width=275px height=25px src="https://user-images.githubusercontent.com/42218088/125296133-5889e480-e2fc-11eb-8b24-20ff8749e8eb.png"></a>
</p>


<p align="center">---------------</p>
<h3 align="center"> That's it. You deployed your Infrastructure as Code to AWS. Congratulations! </h3>

