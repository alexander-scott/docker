### Dockerized Bazel

Docker image containing bazel and a bunch of other goodies.

###### Starting

```bash
docker run -it --rm -v /home/src:/workspace/src -v "$HOME/.ssh:$HOME/.ssh:ro" -v "$HOME/.netrc:$HOME/.netrc:ro" -v "/mnt/ramdisk:/bazel_out" -v "$HOME/.cache:$HOME/.cache" -v "$(mktemp -d):$HOME/.cache/bazel/_bazel_$USERNAME/$(echo -n /workspace/src | md5sum | cut -d' ' -f1)" -v "$HOME/.cache/bazel/_bazel_$USERNAME/$(echo -n $HOME | md5sum | cut -d' ' -f1)/external:$HOME/.cache/bazel/_bazel_$USERNAME/$(echo -n /workspace/src | md5sum | cut -d' ' -f1)/external" -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/group:/etc/group:ro --env "http_proxy=$http_proxy" --env "https_proxy=$https_proxy" --env "no_proxy=$no_proxy" mihaigalos/dockerized_bazel
```

###### Attaching to running, reusing bazel server

```bash
docker exec -t --user $UID:$UID --env "http_proxy=$http_proxy" --env "https_proxy=$https_proxy" --env "no_proxy=$no_proxy" $(docker ps | tail -1 | awk '{print $1}')
```