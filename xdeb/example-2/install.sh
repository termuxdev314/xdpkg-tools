#!/bin/bash

debs=$(ls debs)

for deb in ${debs}; do
	dpkg-deb -x debs/${deb} git-xdeb
	autogit
done
