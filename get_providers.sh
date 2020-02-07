#!/bin/bash
# AUTHOR: Phil Porada - philporada@gmail.com
# TICKET: https://github.com/hashivim/vim-terraform/issues/40
# WHAT: As of Terraform 0.10.0, Hashicorp split out each provider into its own
#       separate terraform-provider-* project. As a result, we have to hunt
#       for all of the resources that each provider provides. This is a PITA
#       but I guess good for Terraform. ¯\_(ツ)_/¯

command -v jq >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "You need to install jq. Exiting..."
    exit 1
fi

function get_providers() {
    mkdir -p terraform-providers
    # Make a ramdisk because there is a ton of stuff to download
    sudo mount -t tmpfs -o size=512m tmpfs $(pwd)/terraform-providers
    cd terraform-providers
    for PAGE in {1..3}; do
        for REPO in $(curl -sL https://api.github.com/users/terraform-providers/repos?page=${PAGE}\&per_page=100 | jq -r .[].name); do
            if [ ! -d ${REPO} ]; then
                git clone --depth 1 https://github.com/terraform-providers/${REPO}
                # Only get the folder/files we need. There's probably a better way checkout only the files we need, but I don't know it.
                cd ${REPO}
                find . -type f -not -name "*provider*.go" -and -not -name "*registration*.go" -delete
                cd ..
            else
                cd ${REPO}
                git pull --hard --depth 1 https://github.com/terraform-providers/${REPO}
                cd ..
            fi
        done
    done
}

get_providers
