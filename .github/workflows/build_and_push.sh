#! /bin/bash

function build() {
    time DOCKER_BUILDKIT=1 docker build . --file Dockerfile$DOCKERFILE_SUFFIX ${PLATFORM} --tag $IMAGE_NAME
}

function set_variables() {

    export IMAGE_ID=docker.pkg.github.com/"${GITHUB_REPO}"/$IMAGE_NAME
    IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]')

    # Strip git ref prefix from version
    export VERSION=$(echo "${GITHUB_REF}" | sed -e 's,.*/\(.*\),\1,')

    # Strip "v" prefix from tag name
    [[ "${GITHUB_REF}" == "refs/tags/"* ]] && VERSION=$(echo $VERSION | sed -e 's/^v//')

    # Use Docker `latest` tag convention
    [ "$VERSION" == "master" ] && VERSION=latest

    echo IMAGE_ID=$IMAGE_ID
    echo VERSION=$VERSION

}

function push() {

    docker tag $IMAGE_NAME $IMAGE_ID:$VERSION
    docker push $IMAGE_ID:$VERSION

    if [[ $VERSION == "latest" || $VERSION == "merge" ]]; then
        COMMAND=$(echo $FOLDER | sed -e "s,/,,g")

        TOOL_VERSION=$($(echo $COMMAND --version) | grep -i $COMMAND | sed -e "s/[^0-9]*\([0-9.]\+\).*/\1/g")
        TOOL_VERSION="${TOOL_VERSION:-latest}"
        echo TOOL_VERSION=$TOOL_VERSION

        docker tag $IMAGE_NAME $IMAGE_ID:$TOOL_VERSION
        docker push $IMAGE_ID:$TOOL_VERSION
    fi

}

function main() {

    FOLDERS=$(ls -d */)
    for FOLDER in $FOLDERS; do
    pushd $FOLDER
        export IMAGE_NAME=$(echo $FOLDER | sed -e "s,/,,g")$DOCKERFILE_SUFFIX
        if [ -f Dockerfile$DOCKERFILE_SUFFIX ]; then
            build
            set_variables
            push    
        fi
    popd
    done

}

main
