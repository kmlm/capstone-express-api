#!/bin/bash


API="http://localhost:4741"
URL_PATH="/games"
TOKEN=cE+QosXX1Gx6whE+ufDWDVKSpwMCwEcte4Q/lOz6W5o=--ENwg8/YWSboGxd6ojOsr6xeaftD5hVFHlxhd/izmtfg=
DATE='2017-01-01'
HOME='Tottenham'
AWAY='Burnley'
EVENTMINUTE=90
EVENTTYPE='Penalty'
PLAYER='Alli'
COMMENT='testing comment'

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "game":
    {
      "date": "'"${DATE}"'",
      "home": "'"${HOME}"'",
      "away": "'"${AWAY}"'",
      "events" :[{
          "minute": "'"${EVENTMINUTE}"'",
          "eventType": "'"${EVENTTYPE}"'",
          "player": "'"${PLAYER}"'",
          "comment": "'"${COMMENT}"'"
          }]
    }
  }'

echo
