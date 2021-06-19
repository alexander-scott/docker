Small static checks ran on each commit using the `pre-commit` toolbox.

Usage:

```bash
$ cat <<EOF > .git/hooks/pre-commit
    docker run --rm -t -v $PWD:/src -v ~/.cache/pre-commit:/root/.cache/pre-commit pre-commit
    EOF
    chmod +x .git/hooks/pre-commit
EOF
```

Screenshot:

![alt text](screenshots/demo.png "Demo checks.")
