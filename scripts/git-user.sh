#!/bin/bash -e
GIT_USER_NAME=""
GIT_USER_EMAIL=""

usage() {
  printf "Usage: %s [options]\n\n" "${0}" 1>&2
  printf "Options:\n" 1>&2
  printf "  -n <arg>\t git user name\n" 1>&2
  printf "  -e <arg>\t git user email\n" 1>&2
  exit 1
}

while getopts ":n:e:" option; do
  case "${option}" in
  n)
    GIT_USER_NAME="${OPTARG}"
    ;;
  e)
    GIT_USER_EMAIL="${OPTARG}"
    ;;
  *)
    usage
    ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "${GIT_USER_NAME}" ] || [ -z "${GIT_USER_EMAIL}" ]; then
  usage
fi

echo "Configuring git user details"
git config --local user.name "${GIT_USER_NAME}"
git config --local user.email "${GIT_USER_EMAIL}"
