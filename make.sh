#! /bin/bash
TMPNAME=pygr-`date +"%y%m%d%H%M%S"`
cd /tmp
mkdir ${TMPNAME}
cd ${TMPNAME}

git clone git://github.com/cjlee112/pygr.git pygr
cd pygr/doc
make
cp -r html_new ../../nightly

##

#@ git checkout v0.8.2
#@ cp -r html_new ../../pygr-docs-0.8.2

cd ../..

#@ ln -fs pygr-docs-0.8.2 latest-release

rsync -av nightly pygr-docs-* latest-release t@teckla.idyll.org:/domains/pygr.org/html/docs
echo BUILD IN ${TMPNAME}
