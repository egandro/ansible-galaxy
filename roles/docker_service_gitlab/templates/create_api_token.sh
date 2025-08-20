#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# we need to be in the path for 'docker compose'
cd "${SCRIPTPATH}"

# this creates a personal access token for the admin user bypassing the UI
# https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html

# scopes: https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/auth.rb


# https://gitlab.com/snippets/1698385
# Create API Token from Rails Console


USER_NAME=$1
KEY_NAME=$2


if [ -z "$KEY_NAME" ]; then
     KEY_NAME="api key"
fi

if [ "$USER_NAME" = "root" ]; then
# expires by the end of day
SCRIPT=$(cat <<EOF
u = User.find_by_username("root")
expires_at = Time.now.utc + 1.days
pat = PersonalAccessToken.new(user_id: u.id, name: "${KEY_NAME}", scopes: Gitlab::Auth::API_SCOPES, expires_at: expires_at)
pat.save!
u.personal_access_tokens << pat
puts pat.token
EOF
)
else
# expires never
SCRIPT=$(cat <<EOF
u = User.find_by_username("${USER_NAME}")
expires_at = Time.now.utc + 360.days
pat = PersonalAccessToken.new(user_id: u.id, name: "${KEY_NAME}", scopes: Gitlab::Auth::API_SCOPES + Gitlab::Auth::REPOSITORY_SCOPES + Gitlab::Auth::REGISTRY_SCOPES, expires_at: expires_at)
pat.save!
u.personal_access_tokens << pat
puts pat.token
EOF
)
fi

# https://docs.gitlab.com/ee/administration/operations/rails_console.html
docker compose exec -it gitlab \
     /bin/bash -c "echo -n '$SCRIPT' | bin/rails console -e production  2>/dev/null | tail -n3 | head -1 | sed -e 's/^.*token//'"

