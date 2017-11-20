#!/bin/bash
VERSION=$1

function usage {
    echo -e "
    USAGE EXAMPLES:

        ./$(basename $0) 0.8.7
        ./$(basename $0) 0.9.2
    "
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

EXISTING_TF_VERSION=$(terraform version | head -n1 | sed -e 's/Terraform//gI' -e 's/v//gI' -e 's/[[:space:]]//g')

if [ "${EXISTING_TF_VERSION}" != "${VERSION}" ]; then
    echo "-) You are trying to update this script for terraform ${VERSION} while you have"
    echo "   terraform ${EXISTING_TF_VERSION} installed at $(which terraform)."
    echo "   Please update your local terraform before using this script."
    exit 1
fi

echo "+) Acquiring terraform-${VERSION}"
wget https://github.com/hashicorp/terraform/archive/v${VERSION}.tar.gz

echo "+) Extracting terraform-${VERSION}.tar.gz"
tar zxf v${VERSION}.tar.gz

echo "+) Getting providers"
./get_providers.sh

echo "+) Running update_commands.rb"
./update_commands.rb

echo "+) Running update_data_sources.rb"
./update_data_sources.rb

echo "+) Running update_syntax.rb"
./update_syntax.rb

echo "+) Updating the badge in the README.md"
sed -i "/img.shields.io/c\[\![](https://img.shields.io/badge/Supports%20Terraform%20Version-%3E%3D${VERSION}-blue.svg)](https://github.com/hashicorp/terraform/blob/v${VERSION}/CHANGELOG.md)" README.md

echo "+) Cleaning up after ourselves"
rm -f v${VERSION}.tar.gz
rm -rf terraform-${VERSION}

git status
