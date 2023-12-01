# Git Server
## Description
Git Server is a Dockerized application designed to store repositories for sharing with robots locally via SSH.

## How to Use

### Build the Docker Image

To build the Docker image, execute the following command in the project directory:

```bash
docker build . -t git-server
```

### Run the Docker Container
To run the Git Server as a Docker container, use the following command:

```bash
docker run --name my_git_server -it -d -p 1248:22 -v $HOME/my_repo_dir/:/repo_dir git-server:latest
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
Before pushing or pulling, set the remote repository for Git Server using:
```bash
git remote set-url origin ssh://root@your_ip:1248/repo_dir/repository.git
```
After adding remote repository now you can push or pull, using the following command:
```bash
# Push to Git Server
git push origin your_branch

# Pull from Git Server
git pull origin your_branch
```
feel free to replace `your_branch` with the appropriate branch name
