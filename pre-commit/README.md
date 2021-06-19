Small static checks ran on each commit using the `pre-commit` toolbox.
Installation mounts the whole repo into the docker and performs the checks on each commit.
Configuration performed in the `.pre-commit-config` yaml file.
##### Prerequisites

`.pre-commit-config` needs to be present in the root of the repo. 

##### Installation:

```bash
$ cat <<EOF > .git/hooks/pre-commit
    docker run --rm -t -v $PWD:/src -v ~/.cache/pre-commit:/root/.cache/pre-commit pre-commit
    EOF
    chmod +x .git/hooks/pre-commit
EOF
```

##### Screenshot

![alt text](screenshots/demo.png "Demo checks.")
