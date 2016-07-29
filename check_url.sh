#!/bin/bash

RESPONSE=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "http://www.voyagerinnovation.com")

case $RESPONSE in
	[200-226]*)
		echo "HTTP status: $RESPONSE, \"Success\""
		exit 0
	;;
	[300-308]*)
		echo "HTTP status: $RESPONSE, \"Redirection\""
		exit 1
	;;
	[500-511]*)
		echo "HTTP status: $RESPONSE, \"Server error\""
		exit 2
	;;
	*)
		echo "HTTP status: $RESPONSE"
		exit 3
	;;
esac
