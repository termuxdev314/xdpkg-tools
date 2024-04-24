#!/bin/bash

mkdir -p git-xdeb/DEBIAN

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
			nvim git-xdeb/DEBIAN/${question}
			chmod 755 git-xdeb/DEBIAN/${question}
			;;
		n|N)
			echo "skip ${question}"
			;;
	esac
done
cat <<EOF > git-xdeb/DEBIAN/control
Package:
Version:
Architecture:
Priority:
Section:
Depends:
Maintainer:
Description:
EOF
nvim git-xdeb/DEBIAN/control
chmod 755 git-xdeb/DEBIAN/
bsdtar -cf git.xdeb python-xdeb/*
exit 0
