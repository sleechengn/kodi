#!/usr/bin/bash
if [ $1 ]; then
	docker build . -t $1
else
	docker build . -t sleechengn/kodi:latest
fi
