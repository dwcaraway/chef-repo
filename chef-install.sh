#!/bin/bash
$(command -v chef-client > /dev/null 2>&1)
FOUND_CHEF=$?

if [ "$FOUND_CHEF" -ne '0' ]
then
    $(command -v curl > /dev/null 2>&1)
    FOUND_CURL=$?
    if [ "$FOUND_CURL" -ne '0' ]
     then
        apt-get -q -y install curl
	echo 'curl installed.'
    fi
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
    echo 'chef installed.'
fi
