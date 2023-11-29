## Git Server

### How to Build
```bash
docker build . -t git-server --build-arg --build-arg PASSWORD=rlggyp1248
```
### How to Use
```bash
docker run --name my_git_server -it -d -p 1248:22 -v $HOME/my_repo_dir/:/repo_dir git-server:latest
```
