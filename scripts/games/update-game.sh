#!/bin/bash

API="http://localhost:4741"
URL_PATH="/games"
ID=5a1d972a272bc00b45e35648
TOKEN=cE+QosXX1Gx6whE+ufDWDVKSpwMCwEcte4Q/lOz6W5o=--ENwg8/YWSboGxd6ojOsr6xeaftD5hVFHlxhd/izmtfg=
DATE='2017-01-01'
HOME='Tottenham'
AWAY='Burnley'
EVENTMINUTE=90
EVENTTYPE='Penalty'
PLAYER='Alli'
COMMENT='testing comment'
DATE2='2017-02-02'
HOME2='Tottenham'
AWAY2='Burnley'
EVENTMINUTE2=90
EVENTTYPE2='Penalty'
PLAYER2='Alli'
COMMENT2='testing comment'

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
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
        },
        {
          "minute": "'"${EVENTMINUTE2}"'",
          "eventType": "'"${EVENTTYPE2}"'",
          "player": "'"${PLAYER2}"'",
          "comment": "'"${COMMENT2}"'"
    }
        ]
    }
  }'

echo
