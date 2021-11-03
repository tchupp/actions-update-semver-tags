#!/usr/bin/env bash

set -euo pipefail

export "$(grep "match=" action.yml | sed 's/^[ ]*//' | xargs)"

# shellcheck disable=SC2154
[[ "v1" =~ $match ]] && echo "false" || echo "true"

[[ "v1.2" =~ $match ]] && echo "false" || echo "true"

[[ "v1.2.3" =~ $match ]] && echo "true" || echo "false"

[[ "v1.2.3-rc" =~ $match ]] && echo "true" || echo "false"

[[ "v1.2.3-beta" =~ $match ]] && echo "true" || echo "false"

[[ "v1.2.3-beta+4" =~ $match ]] && echo "true" || echo "false"

[[ "v1.2.3-beta.4.5" =~ $match ]] && echo "true" || echo "false"

[[ "v1.2.3-beta.4.5.6" =~ $match ]] && echo "true" || echo "false"
