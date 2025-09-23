#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: missing domain parameter."
  exit 1
fi

DOMAIN="$1"

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
CURRENT_CERTS_DIR="${SCRIPT_DIR}/letsencrypt/live"

ZIP_FILE="${SCRIPT_DIR}/certs-${DOMAIN}.zip"

if [ "$2" = "--" ]; then
  # redirect to stdout
  ZIP_FILE="-"
fi

TMPFILE="$(mktemp)"
trap 'rm -rf -- "$TMPFILE"' EXIT

find "${CURRENT_CERTS_DIR}" -name "cert.pem" \
          -exec sh -c 'openssl x509 -noout -subject -in "$0" | sed -e "s|.*CN *= *||" | sed -z "s|\n|, |g" && echo "$0"' {} \; >"${TMPFILE}"

REGEX_DOMAIN=$(echo "$DOMAIN" | sed 's/\*/\\*/g' | sed 's/\./\\./g')

MATCH=$(cat "${TMPFILE}" | grep -E "^${REGEX_DOMAIN}," | head -n1)

if [ -z "${MATCH}" ]; then
  echo "Error: domain ${DOMAIN} not found."
  exit 1
fi

CERT_FILE=$(echo "${MATCH}" | sed -e 's|^.*, ||')
KEY_FILE=$(dirname "${CERT_FILE}")/privkey.pem

zip -qq -j "${ZIP_FILE}" "${CERT_FILE}" "${KEY_FILE}"
