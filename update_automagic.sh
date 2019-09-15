#!/bin/bash
VERSION="${1}"

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

PLATFORM="$(uname | tr [A-Z] [a-z])"

echo "+) Acquiring terraform-${VERSION}"
if [ ! -f "terraform_${VERSION}_${PLATFORM}_amd64.zip" ]; then
    curl -O https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_${PLATFORM}_amd64.zip
fi

echo "+) Extracting terraform-${VERSION}.tar.gz"
rm -f terraform
unzip terraform_${VERSION}_${PLATFORM}_amd64.zip

echo "+) Getting providers"
./get_providers.sh

echo "+) Running update_commands.rb"
./update_commands.rb

echo "+) Running update_data_sources.rb"
./update_data_sources.rb

echo "+) Running update_resources.rb"
./update_resources.rb

echo "+) Updating the badge in the README.md"
sed -i "/img.shields.io/c\[\![](https://img.shields.io/badge/Supports%20Terraform%20Version-%3E%3D${VERSION}-blue.svg)](https://github.com/hashicorp/terraform/blob/v${VERSION}/CHANGELOG.md)" README.md

echo "+) Cleaning up after ourselves"
rm -f terraform_${VERSION}_${PLATFORM}_amd64.zip
rm -f terraform
rm -rf terraform-${VERSION}
sudo umount terraform-providers

git status
