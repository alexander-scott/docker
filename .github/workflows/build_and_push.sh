#! /bin/bash

FOLDERS=$(ls -d */)
for FOLDER in $FOLDERS; do
pushd $FOLDER
    IMAGE_NAME=$(echo $FOLDER | sed -e "s,/,,g")$DOCKERFILE_SUFFIX
    if [ -f Dockerfile$DOCKERFILE_SUFFIX ]; then

    docker build . --file Dockerfile$DOCKERFILE_SUFFIX ${PLATFORM} --tag $IMAGE_NAME

    IMAGE_ID=docker.pkg.github.com/"${GITHUB_REPO}"/$IMAGE_NAME

    IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]')

    # Strip git ref prefix from version
    VERSION=$(echo "${GITHUB_REF}" | sed -e 's,.*/\(.*\),\1,')

    # Strip "v" prefix from tag name
    [[ "${GITHUB_REF}" == "refs/tags/"* ]] && VERSION=$(echo $VERSION | sed -e 's/^v//')

    # Use Docker `latest` tag convention
    [ "$VERSION" == "master" ] && VERSION=latest

    echo IMAGE_ID=$IMAGE_ID
    echo VERSION=$VERSION

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
    fi
popd
done