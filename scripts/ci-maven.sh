#!/bin/bash -e
CI_MAVEN_PROFILES=""
CI_MAVEN_GOAL="${CI_MAVEN_GOAL:-"install"}"
CI_MAVEN_REVISION_PROPERTY=""
CI_MAVEN_SHA1_PROPERTY=""
CI_MAVEN_CHANGELIST_PROPERTY=""
CI_MAVEN_INCREMENTOR_PROPERTY=""

usage() {
  printf "Usage: %s [options]\n\n" "${0}" 1>&2
  printf "Options:\n" 1>&2
  printf "  -p <arg>\t comma separated list of profiles to activate\n" 1>&2
  printf "  -g <arg>\t the goal to execute\n" 1>&2
  printf "  -r <arg>\t the revision ci-friendly property value\n" 1>&2
  printf "  -s <arg>\t sha1 ci-friendly property value\n" 1>&2
  printf "  -c <arg>\t changelist ci-friendly property value\n" 1>&2
  printf "  -i <arg>\t revision incrementing strategy\n" 1>&2
  exit 1
}

while getopts ":p:g:r:s:c:i:" option; do
  case "${option}" in
  p)
    if [ -n "${OPTARG}" ]; then
      CI_MAVEN_PROFILES="${CI_MAVEN_PROFILES} -P ${OPTARG}"
    fi
    ;;
  g)
    CI_MAVEN_GOAL=${OPTARG}
    ;;
  r)
    CI_MAVEN_REVISION_PROPERTY="-Drevision=${OPTARG}"
    ;;
  s)
    CI_MAVEN_SHA1_PROPERTY="-Dsha1=${OPTARG}"
    ;;
  c)
    CI_MAVEN_CHANGELIST_PROPERTY="-Dchangelist=${OPTARG}"
    ;;
  i)
    CI_MAVEN_INCREMENTOR_PROPERTY="-Dincrementor=${OPTARG}"
    ;;
  *)
    usage
    ;;
  esac
done
shift $((OPTIND - 1))

echo "Executing ${CI_MAVEN_GOAL} on ${GITHUB_REF}"
mvn -e -B -ntp ${CI_MAVEN_PROFILES} clean ${CI_MAVEN_GOAL} \
  ${CI_MAVEN_REVISION_PROPERTY} \
  ${CI_MAVEN_SHA1_PROPERTY} \
  ${CI_MAVEN_CHANGELIST_PROPERTY} \
  ${CI_MAVEN_INCREMENTOR_PROPERTY}
