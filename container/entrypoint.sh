#!/bin/sh

set -Eeuo pipefail

echo "::group::Internal logs"
prepare-release
release-gem
create-github-release
echo "::endgroup::"
