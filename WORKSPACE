load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

load("@io_bazel_rules_docker//container:image.bzl", "container_image")

container_image()


http_archive(
    name = "exa",
    urls = ["https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip"],
    #sha256 = "123",
)

