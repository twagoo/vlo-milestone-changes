#/bin/sh

#this uses jq; use 'brew install jq' on Mac

MILESTONE="4"
STATE="all"

URI="https://api.github.com/repos/clarin-eric/VLO/issues?milestone=${MILESTONE}&state=${STATE}"

curl -s $URI | jq -r ".[]|.title,.html_url"
