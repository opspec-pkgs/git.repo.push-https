#!/usr/bin/env sh

set -e

if [ "$dstRepo" == " " ]; then
    # dstRepo not provided; git will push to configured origin push url
    dstRepo=$(git remote get-url --push origin)
fi

host=$(echo "$dstRepo" | awk -F/ '{print $3}')

echo "adding $host to .netrc"
echo -e "machine $host\n" \
"login ${username}\n"\
"password $password" > ~/.netrc

pushCmd='git push'

# handle opts
if [ "$dstRepo" != " " ]; then
    pushCmd=$(printf "%s %s" "$pushCmd" "$dstRepo")
fi

if [ "$refSpec" != " " ]; then
    pushCmd=$(printf "%s %s" "$pushCmd" "$refSpec")
fi

eval "$pushCmd"