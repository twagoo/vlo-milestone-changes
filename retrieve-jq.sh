#/bin/sh

# This uses jq; see https://stedolan.github.io/jq/
# Use 'brew install jq' on Mac

MILESTONE="4"
STATE="all"

MILESTONE_URI="https://api.github.com/repos/clarin-eric/VLO/milestones/${MILESTONE}"
ISSUES_URI="https://api.github.com/repos/clarin-eric/VLO/issues?milestone=${MILESTONE}&state=${STATE}"

curl -s "${MILESTONE_URI}" | jq -r ".title"
curl -s "$ISSUES_URI" | jq -r ".[] | (\"* \" + .title), \"    <\" + .html_url + \">\""
