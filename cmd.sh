#!/usr/bin/env sh

if [ "$dstRepo" == " " ]; then
    echo "dstRepo not provided; will push to configured origin push url"
    # fallback to use configured origin push url as dstRepo
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