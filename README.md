# Phonebook Web Application on AWS with Terraform

The Phonebook Application aims to create a phonebook application in Python and deployed as a web application with Flask on AWS Application Load Balancer with Auto Scaling Group of Elastic Compute Cloud (EC2) Instances and Relational Database Service (RDS) using Terraform.

## Overview

This project involves creating a phonebook web application using Python Flask and deploying it on AWS using Terraform. The application allows users to manage contacts in a phonebook, stored in a MySQL database on AWS RDS. The deployment includes an AWS Application Load Balancer, Auto Scaling Group of EC2 Instances, and a relational database service.

## Project Structure

*****phonebook*****

|-- main.tf $\quad$ $\quad$ $\quad$ $\quad$ $\quad$ $\quad$ $\quad$              # Terraform configuration file\
|-- phonebook-app.py $\quad$ $\quad$ $\quad$         # Python Flask Web Application\
|-- templates\
| $\quad$  |-- index.html  $\quad$ $\quad$ $\quad$ $\quad$   # HTML template for search page\
| $\quad$ |-- add-update.html  $\quad$ $\quad$  # HTML template for add/update page\
| $\quad$  |-- delete.html   $\quad$ $\quad$ $\quad$      # HTML template for delete page\
|-- tf-phonebook.png  $\quad$ $\quad$ $\quad$       # Project image\
|-- search-snapshot.png  $\quad$ $\quad$    # Expected outcome snapshot\
|-- readme.md        $\quad$ $\quad$ $\quad$ $\quad$ $\quad$      # Project documentation (**you are here**)


## Features

- **Phonebook Operations**: Users can search, add, update, and delete records in the phonebook.

- **Input Validation**: The application validates user inputs, ensuring proper name and numeric phone number formats.

- **Web Application**: The code transforms into a web application using Flask and three HTML templates.

- **AWS Deployment**: Terraform deploys the application on AWS, utilizing Application Load Balancer, EC2 Instances, and RDS.

- **Security Measures**: Security groups are configured to control traffic, and instances are launched in an Auto Scaling Group.

## Getting Started

1. **Clone the Repository**: `git clone [repository-url]`

2. **Install Dependencies**: Ensure you have Python, Flask, and Terraform installed.

3. **Configure AWS CLI**: Set up AWS CLI with necessary credentials.

4. **Run Terraform Commands**:
    ```bash
    terraform init
    terraform apply
    ```

5. **Access the Web Application**: Visit the provided URL after Terraform completes the deployment.

## Input Format Examples

- Valid Name: "John Doe"
- Invalid Name: "12345" (Warning: Name should be text)
- Valid Number: "1234567890"
- Invalid Number: "thousand" (Warning: Number should be in numeric format)

## Screenshots

![Search Page](./tf-phonebook.png)

## Developer

- **Name**: Adnan Turgay Aydin
- **Email**: taydinadnan@gmail.com

## Resources

- [Python Flask Framework](https://flask.palletsprojects.com/en/1.1.x/quickstart/)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/index.html)
