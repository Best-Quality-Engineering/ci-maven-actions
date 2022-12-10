#!/bin/bash -e
VERSION=""
RELEASE_BRANCH=""
BASE_BRANCH=""

usage() {
  printf "Usage: %s [options]\n\n" "${0}" 1>&2
  printf "Options:\n" 1>&2
  printf "  -v <arg>\t release version\n" 1>&2
  printf "  -r <arg>\t release branch name\n" 1>&2
  printf "  -b <arg>\t base branch name\n" 1>&2
  exit 1
}

while getopts ":v:r:b:" option; do
  case "${option}" in
  v)
    VERSION="${OPTARG}"
    ;;
  r)
    RELEASE_BRANCH="${OPTARG}"
    ;;
  b)
    BASE_BRANCH="${OPTARG}"
    ;;
  *)
    usage
    ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "${VERSION}" ] || [ -z "${RELEASE_BRANCH}" ] || [ -z "${BASE_BRANCH}" ]; then
  usage
fi

echo "Committing tracked changes to ${RELEASE_BRANCH}"
git add -u
git commit -m "Release ${VERSION}"
echo "Pushing ${RELEASE_BRANCH} to origin"
git push -u origin "${RELEASE_BRANCH}"

echo "Merging ${RELEASE_BRANCH} to ${BASE_BRANCH}"
git fetch
git checkout "${BASE_BRANCH}"
git pull origin "${BASE_BRANCH}"
git merge "${RELEASE_BRANCH}"

echo "Pushing ${BASE_BRANCH} to origin"
git push -u origin "${BASE_BRANCH}"

echo "Deleting ${RELEASE_BRANCH} from origin"
git push origin --delete "${RELEASE_BRANCH}"
