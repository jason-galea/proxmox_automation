#!/bin/bash

export BASE_DIR=$(dirname $0)
export API_URL="http://10.1.1.243:9000/api"
export PORTAINER_PASSWORD=$(cat $BASE_DIR/../portainer_password.txt)
export JWT_TOKEN=$(http POST $API_URL/auth Username="admin" Password="$PORTAINER_PASSWORD" | jq -r ."jwt")


echo -e "\n==> List all stacks"
http GET $API_URL/stacks \
      "Authorization: Bearer $JWT_TOKEN"
