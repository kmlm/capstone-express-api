#!/bin/bash


API="http://localhost:4741"
URL_PATH="/games"
TOKEN=KVIgjHNtKQFW+8DUfbfNiA3I148L3Gl83dQ6IDsUth8=--K/KudjYlVsBhGSVmVEVEHvyQhqN5IyYHdg+ZTELg2S4=
DATE='2017-01-01'
HOME='Tottenham'
AWAY='Burnley'
EVENTMINUTE=90
EVENTTYPE='Penalty'
PLAYER='Alli'
COMMENT='testing comment asdi;fjasdf asdf;oijadsf asdf;oi jasdf ;oijdsf ;oaidjsf ;oisdj f;oijasd f;oijsd f;oijasd f;oijasd f;oijasd ;oijsdf ;oijsd f;oijsad f;oijasd f;oijsd f;oijasd f;oijasdf;o ijsd ;foij'
TEAM='Tottenham'

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
          "team": "'"${TEAM}"'",
          "eventType": "'"${EVENTTYPE}"'",
          "player": "'"${PLAYER}"'",
          "comment": "'"${COMMENT}"'"
          }]
    }
  }'

echo
