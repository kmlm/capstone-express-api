#!/bin/sh

API="http://localhost:4741"
URL_PATH="/games"
TOKEN=cE+QosXX1Gx6whE+ufDWDVKSpwMCwEcte4Q/lOz6W5o=--ENwg8/YWSboGxd6ojOsr6xeaftD5hVFHlxhd/izmtfg=

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
