#/bin/sh

#this uses jq; use 'brew install jq' on Mac

MILESTONE="3"
STATE="open"

URI="https://api.github.com/repos/clarin-eric/VLO/issues?milestone=${MILESTONE}&state=${STATE}"

curl -s $URI | jq -r ".[]|.title,.html_url"
