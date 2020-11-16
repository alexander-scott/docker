#! /bin/bash

set -oux

function generate_dockerfiles_from_j2() {
    declare -A baseimages_to_dockerfile_suffixes=()

    while IFS= read -r -d '' key && IFS= read -r -d '' value; do
        baseimages_to_dockerfile_suffixes[$key]=$value
    done < <(jq -j 'to_entries[] | (.key, "\u0000", .value, "\u0000")' <<<$(cat baseimages_to_dockerfile_suffixes.json))


    for baseimage in ${!baseimages_to_dockerfile_suffixes[@]}; do
        echo Generating Dockerfile"${baseimages_to_dockerfile_suffixes[$baseimage]}".
        echo {\"baseimage\":\"$baseimage\"} |
        j2 -f json Dockerfile.j2 > Dockerfile"${baseimages_to_dockerfile_suffixes[$baseimage]}"
    done
}

function main() {

    FOLDERS=$(ls -d */)
    for FOLDER in $FOLDERS; do
    pushd $FOLDER
        generate_dockerfiles_from_j2
    popd
    done

}

main
