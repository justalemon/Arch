#!/usr/bin/env bash

arch=("x86_64")

for a in "${arch[@]}"; do
    echo "Building $a"
    # shellcheck disable=SC2086
    repo-add -n -R "$a/lemon.db.tar.gz" $a/*.pkg.tar.zst
    # shellcheck disable=SC2086
    rm $a/*.tar.gz.old
done
