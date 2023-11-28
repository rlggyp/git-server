## Git Server

### How to Build
```bash
docker build . -t git-server --build-arg NEW_USER=rlggyp --build-arg PASSWORD=rlggyp123
```

### How to Use
```bash
docker run --name my_git_server -it -d -p 1234:22 -v $HOME/my_repo_dir/:/repo_dir git-server:latest
```