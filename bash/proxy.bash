#!/bin/bash
#	Sets the environment to use a proxy by setting the required variables.
#	Must be used together with a 'source' alias in order to set the variables for the current shell.
#

proxy () {
	while getopts 'l' option; do
		case "$option" in
			l)
				echo "HTTP:  ${HTTP_PROXY:(none)}";
				echo "HTTPS: ${HTTPS_PROXY:(none)}";
				echo "FTP:   ${FTP_PROXY:(none)}";
				echo "SOCKS: ${SOCKS_PROXY:(none)}";
				;;
			\?)
				exit 1;
				;;
		esac;
	done;

	case "$1" in
	di|di.uminho)
		export HTTP_PROXY='http://proxy.di.uminho.pt:3128';
		export HTTPS_PROXY='https://proxy.di.uminho.pt:3128';
		export FTP_PROXY='ftp://proxy.di.uminho.pt:3128';
		export SOCKS_PROXY='socks://socks.di.uminho.pt:1080';
		;;
	uminho)
		export HTTP_PROXY='http://proxy.uminho.pt:3128';
		export HTTPS_PROXY='https://proxy.uminho.pt:3128';
		export FTP_PROXY='ftp://proxy.uminho.pt:3128';
		export SOCKS_PROXY='socks://socks.uminho.pt:1080';
		;;
	none)
		unset HTTP_PROXY;
		unset HTTPS_PROXY;
		unset FTP_PROXY;
		unset SOCKS_PROXY;
		;;
	*)
		;;
	esac;
}
