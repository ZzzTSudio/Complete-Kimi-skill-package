#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Ensure the Nuitka-compiled binary handles UTF-8 paths/filenames correctly
# even when the system locale is POSIX/C (Nuitka does not auto-enable PEP 540).
export PYTHONUTF8=1
: "${LC_ALL:=C.UTF-8}"; export LC_ALL
: "${LANG:=C.UTF-8}";   export LANG

exec "$SCRIPT_DIR/runtime/kimi_pptd" convert "$@"
