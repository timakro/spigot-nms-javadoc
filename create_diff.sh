#!/bin/sh

cd "$(dirname $0 | xargs readlink -f)"

nms=$(find ../work -maxdepth 1 -type d | grep "^../work/decompile-" | head -1)
git diff --no-index $nms decompile_nms > nms.patch
