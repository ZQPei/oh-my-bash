#!/usr/bin/env bash

set -e

tmpdir=$(mktemp -d)

export OSH="$tmpdir/path with space"
export HOME="$tmpdir/home with space"
mkdir -p "$HOME"

TMPOSH=/tmp/oh-my-bash && rm -rf ${TMPOSH} && git clone -b main --depth=1 https://github.com/ZQPei/oh-my-bash.git ${TMPOSH} && bash ${TMPOSH}/tools/install_local.sh && rm -rf ${TMPOSH}

source "$HOME/.bashrc"

set | grep -aE "^OSH"

if [[ "$OSH_THEME" == "pzq" ]]; then
  echo "Installation succeeded"
else
  echo "Installation failed, \$OSH_THEME is not set to 'font'"
  exit 1
fi
