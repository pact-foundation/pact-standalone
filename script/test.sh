#!/bin/bash -eu
set -eu # This needs to be here for windows bash, which doesn't read the #! line above

detected_os=$(uname -sm)
echo detected_os = $detected_os
BINARY_OS=${BINARY_OS:-}
BINARY_ARCH=${BINARY_ARCH:-}
FILE_EXT=${FILE_EXT:-}

if [ "$BINARY_OS" == "" ] || [ "$BINARY_ARCH" == "" ] ; then 
    case ${detected_os} in
    'Darwin arm64')
        BINARY_OS=osx
        BINARY_ARCH=arm64
        ;;
    'Darwin x86' | 'Darwin x86_64' | "Darwin"*)
        BINARY_OS=osx
        BINARY_ARCH=x86_64
        ;;
    "Linux aarch64"* | "Linux arm64"*)
        BINARY_OS=linux
        BINARY_ARCH=arm64
        ;;
    'Linux x86_64' | "Linux"*)
        BINARY_OS=linux
        BINARY_ARCH=x86_64
        ;;
    "Windows"* | "MINGW64"*)
        BINARY_OS=windows
        BINARY_ARCH=x86_64
        ;;
      *)
      echo "Sorry, os not determined"
      exit 1
        ;;
    esac;
fi

if [ "$BINARY_OS" != "windows" ] ; then PATH_SEPERATOR=/ ; else PATH_SEPERATOR=\\; fi
PATH_TO_BIN=.${PATH_SEPERATOR}pkg${PATH_SEPERATOR}pact${PATH_SEPERATOR}bin${PATH_SEPERATOR}


tools=(
  pact-broker
  pact-mock-service
  pact-provider-verifier
  pact-stub-service
  pactflow
)

if [ ! -z "${PACT_CLI_LEGACY:-}" ]; then
  tools+=(pact-message)
else
  tools+=(
    pact
    "pact plugin"
    "pact stub"
    "pact verifier"
    "pact mock"
    "pact broker"
  )
fi

test_cmd=""
for tool in "${tools[@]}"; do
  FILE_EXT=""
  test_cmd=""
    case "$tool" in
    *" "*)
      test_cmd="--help"
    ;;
    esac
  if [ "$tool" = "pact-mock-service" ] || [ "$tool" = "pact-provider-verifier" ] || [ "$tool" = "pact-stub-verifier" ]; then
    test_cmd="--help"
  fi
  if [ "$BINARY_OS" = "windows" ]; then
    case "$tool" in
      pact\ *)
      FILE_EXT=".exe"
      ;;
      pact)
      if [ ! -z "${PACT_CLI_LEGACY:-}" ]; then
        FILE_EXT=".exe"
      fi
      ;;
      *)
      FILE_EXT=".bat"
      ;;
    esac
  fi

  case "$tool" in
    *" "*)
    cmd="${tool%% *}"
    arg="${tool#* }"
    echo executing "${cmd}${FILE_EXT}" "${arg}" ${test_cmd}
    "${PATH_TO_BIN}${cmd}${FILE_EXT}" "${arg}" ${test_cmd}
    ;;
    *)
    echo executing "${tool}${FILE_EXT}" ${test_cmd}
    "${PATH_TO_BIN}${tool}${FILE_EXT}" ${test_cmd}
  esac
done