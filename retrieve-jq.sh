#/bin/sh

#this uses jq; use 'brew install jq' on Mac

MILESTONE="3"
STATE="open"

URI="https://api.github.com/repos/clarin-eric/VLO/issues?milestone=${MILESTONE}&state=${STATE}"

#URLs
echo Fetching URLs > /dev/stderr
URLS=`curl -s $URI | jq ".[].html_url"`
#Titles
echo Fetching Titles > /dev/stderr
TITLES=`curl -s $URI | jq ".[].title"`
