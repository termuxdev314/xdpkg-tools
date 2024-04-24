#!/bin/bash

mkdir -p python-xdeb/DEBIAN

questions="preinst
postinst
prerm
postrm"

for question in ${questions}: do
	ask="${question}
	would you add a ${question}
	[y/n]"
	echo "${ask}"
	read choice
	case ${choice} in
		y|Y|*)
			nvim python-xdeb/DEBIAN/${question}
			chmod 755 python-xdeb/DEBIAN/${question}
			;;
		n|N)
			echo "skip ${question}"
			;;
	esac
done
cat <<EOF > python-xdeb/DEBIAN/control
Package:
Version:
Architecture:
Priority:
Section:
Depends:
Maintainer:
Description:
EOF
nvim python-xdeb/DEBIAN/control
chmod 755 python-xdeb/DEBIAN/
bsdtar -cf python-3_11_8.xdeb python-xdeb/*
exit 0
