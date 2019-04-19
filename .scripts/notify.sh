#!/bin/bash

#message="{\"text\":\"\`\`\`"$1"\`\`\`\"}"
message="{\"text\":\""$1"\"}"

curl -s -X POST -H 'Content-type: application/json' --data "${message}" https://hooks.slack.com/services/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 > /dev/null
