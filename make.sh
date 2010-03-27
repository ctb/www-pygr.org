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
cp -r html_new ../../latest-release

cd ../..

rsync -av nightly latest-release t@teckla.idyll.org:/domains/pygr.org/html/docs
echo BUILD IN ${TMPNAME}
