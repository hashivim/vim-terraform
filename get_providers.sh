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
    cd terraform-providers
    for i in $(curl -sL https://api.github.com/users/terraform-providers/repos?per_page=300 | jq -r .[].name); do
        if [ ! -d $i ]; then
            git clone --depth 1 https://github.com/terraform-providers/$i
        else
            pushd $i
            git pull --depth 1 https://github.com/terraform-providers/$i
            popd
        fi
    done
}

get_providers
