# Git Server
## Description
Git Server is a Dockerized application designed to store repositories for sharing with robots locally via SSH.

## How to Use

### Build the Docker Image

To build the Docker image, execute the following command in the project directory:

```bash
docker build . -t git-server
```

### Create Directory
Before creating container, make sure that you have created a directory named `my_repo_dir` on your home directory using this command:
```
mkdir ${HOME}/my_repo_dir
```
feel free to modify it for your shared repository.  
### Run the Docker Container using `docker run`
To run the Git Server as a Docker container, use the following command:
```bash
docker run --name my_git_server -it -d -p 1248:22 -v $HOME/my_repo_dir/:/repo_dir git-server:latest
```
### Run the Docker Container using `docker compose`
To run the Git Server as a Docker container, use the following command:
```bash
docker-commpose up
```
### Access Git Server
Once the container is running, you can access the Git Server via SSH using the specified port:
```bash
ssh -p 1248 root@your_ip
```

### Clone from Git Server
To clone a repository from the Git Server, use the following command:
```bash
git clone ssh://root@your_ip:1248/repo_dir/repository.git
```

### Push and Pull from Git Server
Before pushing or pulling, set the server repository config into bare using this command:
```bash
git config --local core.bare true
```
After setting the server into bare, the client now can push or pull using the following command:
```bash
# Push to Git Server
git push origin your_branch

# Pull from Git Server
git pull origin your_branch
```
feel free to replace `your_branch` with the appropriate branch name
