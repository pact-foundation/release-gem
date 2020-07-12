#!/bin/sh
set -euo pipefail

if [ "${DEBUG:-}" = "true" ]; then
  set -x
fi

finish() {
  echo "::endgroup::"
}

trap finish EXIT

echo "::group::Internal logs"
prepare-release
release-gem
create-github-release
