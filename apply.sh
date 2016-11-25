#!/bin/sh

cd "$(dirname $0 | xargs readlink -f)"

nms=$(find ../work -maxdepth 1 -type d | grep "^../work/decompile-" | head -1)
rm -rf decompile_nms
if [ "$nms" ]; then
    cp -r $nms decompile_nms
fi

patch -p1 -f --dry-run < nms.patch
if [ $? -eq 0 ]; then
    patch -p1 -f < nms.patch
fi
