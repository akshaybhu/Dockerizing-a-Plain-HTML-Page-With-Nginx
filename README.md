# Dockerizing-a-Plain-HTML-Page-With-Nginx
Dockerizing a Plain HTML Page With Nginx


Here's a quick overview of what each of these files (index.html, nginx.conf, Dockerfile) typically means:

Index.html is the default homepage for your website. When a browser requests a directory (like http://example.com/), the server looks for an index.html file to display.

NGINX (root path /usr/share/nginx/html;) specifies the directory where the server will look for files. Combined with the index directive (index index.html;), it directs NGINX to serve the index.html file located in the specified root directory. This ensures that visitors accessing your site will see the content of index.html.

Dockerfile: This file contains instructions for building a Docker image. It specifies the base image, copies files into the container, installs dependencies, and sets up the environment.

Launch EC2 instance for amazon linux machine.
Update using “sudo yum update -y ” and install nginx using “sudo yum install nginx -y”
Then enable/start the nginx service
sudo systemctl start nginx
sudo systemctl enable nginx


Navigate to path cd /usr/share/nginx/html/index.html and edit as per requirement.


Made changes in nginx.conf file at path /etc/nginx/nginx.conf
Save and Restart Nginx to apply the changes:


# Install Docker

sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker



Add your current user to the Docker group:
>> sudo usermod -aG docker $USER
Check if your user is in the Docker group:
>> groups


# Create Dockerfile.

Build it, using command: 
docker build -t my-nginx-docker .


Run and validate it.
docker run -d --name nginx-2 -p 3331:80 my-nginx-docker


# Validate the webpage using public IP address of the EC2 instance:

http://<your-ec2-public-ip>:3331
http://100.29.15.78:3331


# Create your ECR repository

Couldn’t create a public repo due to this error so created private.


# Push commands for akshay-dockerizing-nginx image to ECR:

Repository:- 975050024946.dkr.ecr.us-east-1.amazonaws.com/akshay-dockerizing-nginx

Authenticate your Docker client to your registry. Use the AWS CLI:
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 975050024946.dkr.ecr.us-east-1.amazonaws.com


Build your Docker image using the following command. 
docker build -t akshay-dockerizing-nginx .

After the build completes, tag your image so you can push the image to this repository:
docker tag akshay-dockerizing-nginx:latest 975050024946.dkr.ecr.us-east-1.amazonaws.com/akshay-dockerizing-nginx:latest

Run the following command to push this image to your newly created AWS repository:
docker push 975050024946.dkr.ecr.us-east-1.amazonaws.com/akshay-dockerizing-nginx:latest
