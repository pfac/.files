#!/bin/bash

reload () {
	# source "${UNIXCONFDIR}/bash/reset";
	# source "${UNIXCONFDIR}/bash/setup";
	# source "${UNIXCONFDIR}/bash/config";
	source "${UNIXCONFDIR}/bash/env";
	source "${UNIXCONFDIR}/bash/aliases";
}

reload;
