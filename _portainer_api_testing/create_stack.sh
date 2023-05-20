#!/bin/bash

export BASE_DIR=$(dirname $0)
export API_URL="http://10.1.1.243:9000/api"
export PORTAINER_PASSWORD=$(cat $BASE_DIR/../portainer_password.txt)


echo -e "\n==> Fetching JWT token"
export JWT_TOKEN=$(http POST $API_URL/auth Username="admin" Password="$PORTAINER_PASSWORD" | jq -r ."jwt")
echo $JWT_TOKEN



# echo -e "==> Creating stack for 'scraper'"
# http POST \
#     $API_URL/stacks \
#     "Authorization: Bearer $JWT_TOKEN" \
#     type==2 \
#     method==repository \
#     endpointId==2 \
#     body_compose_repository[name]==scraper \
#     body_compose_repository[repositoryURL]=='https://github.com/jason-galea/price_scraper'


# echo -e "\n==> Creating stack for 'scraper'"
# http POST "$API_URL/stacks?type=2&method=repository&endpointId=2" \
#     "Authorization: Bearer $JWT_TOKEN"
#     # type=='2' \
#     # method=='repository' \
#     # endpointId=='2' \
#     # body_compose_repository[name]=='scraper' \
#     # body_compose_repository[repositoryURL]=='https://github.com/jason-galea/price_scraper'


# echo -e "\n==> Creating stack for 'scraper'"
# http POST "$API_URL/stacks?type=2&method=repository&endpointId=2" \
#     "Authorization: Bearer $JWT_TOKEN" \
#     Name="price_scraper" \
#     RepositoryURL="https://github.com/jason-galea/price_scraper" \
#     ComposeFilePathInRepository="docker-compose.yml"


echo -e "\n==> Creating stack for 'scraper'"
http POST $API_URL/stacks \
    type=="2" \
    method=="repository" \
    endpointId=="2" \
    "Authorization: Bearer $JWT_TOKEN" \
    Name="price_scraper" \
    RepositoryURL="https://github.com/jason-galea/price_scraper"

