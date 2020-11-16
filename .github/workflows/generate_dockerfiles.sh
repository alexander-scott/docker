#! /bin/bash

function generate_dockerfiles_from_j2() {
    declare -A architectures_to_suffixes=()

    while IFS= read -r -d '' key && IFS= read -r -d '' value; do
        architectures_to_suffixes[$key]=$value
    done < <(jq -j 'to_entries[] | (.key, "\u0000", .value, "\u0000")' <<<$(cat architectures.json))


    for architecture in ${!architectures_to_suffixes[@]}; do
        echo Generating Dockerfile"${architectures_to_suffixes[$architecture]}".
        echo {\"architecture\":\"$architecture\"} |
        j2 -f json Dockerfile.j2 > Dockerfile"${architectures_to_suffixes[$architecture]}"
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