#!/bin/bash

usage() { echo "Usage: $0 --url wireguard-server-url -u user -p password --profile name --email email -a allowed_ips_as_json_array" 1>&2; exit 1; }

usage() {
cat << EOF
Usage: create-wireguard-tunnel.sh --url wireguard-server-url -u user -p password --profile name --email email
Create a new wireguard tunnel by using the wireguard-ui.

-h                  Display help

-url                URL of the server e.g. http://192.168.1.1:5000

-u                  User, e.g. admin

-p                  Password, e.g. admin

--profile           Name of the profile, e.g. "John"

--email             Email of the profile, e.g. john@example.com

-a                  allowed IPs, e.g. '["10.201.18.0/24","10.100.17.0/24"]' (as json array)

-o                  Optional output file name (e.g. foo.conf).
                    If the file exists no new tunnel is created.
                    The files are stored in /etc/wireguard/client

-verbose,           Run script in verbose mode. Will print out each step of execution.

EOF
# EOF is found above and hence cat command stops reading. This is equivalent to echo but much neater when printing out.
}

options=$(getopt -l "url:,profile:,email:,verbose" -o "u:p:a:o:h" -a -- "$@")
eval set -- "$options"

while true
do
case "$1" in
-h)
    usage
    exit 0
    ;;
--url)
    shift
    BASE_URL="$1"
    ;;
-u)
    shift
    USER_NAME="$1"
    ;;
-p)
    shift
    PASSWORD="$1"
    ;;
--profile)
    shift
    PROFILE_NAME="$1"
    ;;
--email)
    shift
    PROFILE_EMAIL="$1"
    ;;
-a)
    shift
    ALLOWED_IPS="$1"
    ;;
-o)
    shift
    OUT_FILE=$(basename "$1")
    ;;
--verbose)
    export verbose=1
    set -xv  # Set xtrace and verbose mode.
    ;;
--)
    shift
    break;;
esac
shift
done

if [ -z "${BASE_URL}" ] || [ -z "${USER_NAME}" ] || [ -z "${PASSWORD}" ] || [ -z "${PROFILE_NAME}" ] || [ -z "${PROFILE_EMAIL}" ] || [ -z "${ALLOWED_IPS}" ]; then
    usage
    exit 1
fi


if [ ! -z "${OUT_FILE}" ]; then
  if [ -f "/etc/wireguard/clients/${OUT_FILE}" ]; then
    # user wants an output file - it exists - just output it's content
    cat "/etc/wireguard/clients/${OUT_FILE}"
    exit 0
  fi
fi

# BASE_URL="http://192.168.178.150:5000"
# USER_NAME="admin"
# PASSWORD="admin"

# PROFILE_NAME="footest"
# PROFILE_EMAIL="footest@example.com"

JAR_FILE="$(mktemp /tmp/curl_jar.XXXXXXXXXX)" || { echo "Failed to create temp file"; exit 1; }
chmod 600 "${JAR_FILE}"
#delete on exit
trap 'rm -rf -- "${JAR_FILE}"' EXIT

TMP_OUTPUT="$(mktemp /tmp/wireguard_client.XXXXXXXXXX)" || { echo "Failed to create temp file"; exit 1; }
chmod 600 "${TMP_OUTPUT}"
#delete on exit
trap 'rm -rf -- "${TMP_OUTPUT}"' EXIT

curl -s "${BASE_URL}"'/login' \
  --cookie-jar "${JAR_FILE}" \
  --output /dev/null \
  -H 'Content-Type: application/json' \
  --data-raw '{"username":"'${USER_NAME}'","password":"'${PASSWORD}'","rememberMe":false}'

curl -s "${BASE_URL}"'/api/apply-wg-config' \
  -b "${JAR_FILE}" \
  --output /dev/null \
  -H 'Content-Type: application/json' \
  -X 'POST'

SUGGESTED_IP=$(curl -s "${BASE_URL}"'/api/suggest-client-ips' \
  -b "${JAR_FILE}" \
  -H 'Content-Type: application/json' | jq '.[0]' -r)

ID=$(curl -s "${BASE_URL}"'/new-client' \
  -b "${JAR_FILE}" \
  -H 'Content-Type: application/json' \
  -X 'POST' \
  --data-raw '{"name":"'"${PROFILE_NAME}"'","email":"'"${PROFILE_EMAIL}"'","allocated_ips":["'"${SUGGESTED_IP}"'"],"allowed_ips":'"${ALLOWED_IPS}"',"extra_allowed_ips":[],"use_server_dns":false,"enabled":true,"public_key":"","preshared_key":""}' | jq -r '.id')

curl -s "${BASE_URL}"'/client/set-status' \
  -b "${JAR_FILE}" \
  --output /dev/null \
  -H 'Content-Type: application/json' \
  --data-raw '{"id":"'"${ID}"'","status":true}'

curl -s "${BASE_URL}"'/api/apply-wg-config' \
  -b "${JAR_FILE}" \
  --output /dev/null \
  -H 'Content-Type: application/json' \
  -X 'POST'

echo "# id: ${ID}" > "${TMP_OUTPUT}"
echo "# profile: ${PROFILE_NAME}" >> "${TMP_OUTPUT}"
echo "# email: ${PROFILE_EMAIL}" >> "${TMP_OUTPUT}"
echo "" >> "${TMP_OUTPUT}"
curl -s "${BASE_URL}/download?clientid=${ID}" \
    -b "${JAR_FILE}" >> "${TMP_OUTPUT}"

if [  ! -z "${OUT_FILE}" ]; then
  # output file given - keep the file
  mkdir -p "/etc/wireguard/clients/"
  cp "${TMP_OUTPUT}" "/etc/wireguard/clients/${OUT_FILE}"
fi

cat "${TMP_OUTPUT}"
