#!/usr/bin/env sh

host=$(echo "$url" | awk -F/ '{print $3}')

echo "adding $host to .netrc"
echo -e "machine $host\n" \
"login ${username}\n"\
"password $password" > ~/.netrc

git push "$dstRepo" "$refSpec"