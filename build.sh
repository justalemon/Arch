#!/usr/bin/env bash

arch=("x86_64")

echo "Starting update of Packages"
python download.py
echo "Finished Package updates"

echo "Starting update of Database(s)"
for a in "${arch[@]}"; do
    echo "Building $a"
    # shellcheck disable=SC2086
    repo-add -n -R "$a/lemon.db.tar.gz" $a/*.pkg.tar.zst
    # shellcheck disable=SC2086
    rm $a/*.tar.gz.old

    rm $a/lemon.db
    rm $a/lemon.files
    cp $a/lemon.db.tar.gz $a/lemon.db
    cp $a/lemon.files.tar.gz $a/lemon.files
done
echo "Finished update of Database(s)"

if [ "$1" == "push" ]; then
    echo "Pushing the changes to the main repo"

    if [ "$CI" == "true" ]; then
        git config --global user.name "GitHub Actions"
        git config --global user.email "actions@github.com"
    fi

    git add *
    git commit -m "Updated Package List"
    git push
fi
