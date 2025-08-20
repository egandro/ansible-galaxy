#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# we need to be in the path for 'docker compose'
cd "${SCRIPTPATH}"

GITLAB_TOKEN=$(./create_api_token.sh root)
#GITLAB_TOKEN="glpat-xxxx"
GITLAB_URL="https://{{ docker_service_gitlab_host }}"

#echo TOK: ${GITLAB_TOKEN}

# idea from here: https://forum.gitlab.com/t/create-a-gitlab-runner-registration-token-the-new-method-for-16-x/87363/3

#curl -k -H "Private-token: ${GITLAB_TOKEN}" -X POST "${GITLAB_URL}/api/v4/user/runners?runner_type=instance_type&description=Kitchentest&paused=true&tag_list=test"
JSON=$(curl -s -k -H "Private-token: ${GITLAB_TOKEN}" -X POST "${GITLAB_URL}/api/v4/user/runners?runner_type=instance_type")

#echo JSON: ${JSON}
echo ${JSON} | jq -r .token
