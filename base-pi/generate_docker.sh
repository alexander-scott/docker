#! /bin/bash

declare -A architectures_to_suffixes=()

while IFS= read -r -d '' key && IFS= read -r -d '' value; do
    architectures_to_suffixes[$key]=$value
done < <(jq -j 'to_entries[] | (.key, "\u0000", .value, "\u0000")' <<<$(cat architectures.json))


for architecture in ${!architectures_to_suffixes[@]}; do
    echo Generating Dockerfile for $architecture.
    echo {\"architecture\":\"$architecture\"} |
    j2 -f json Dockerfile.j2 > Dockerfile"${architectures_to_suffixes[$architecture]}"
done
