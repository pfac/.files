#!/bin/bash

function reload () {
	source "${UNIXCONFDIR}/bash/clear";
	source "${UNIXCONFDIR}/bash/setup";
	source "${UNIXCONFDIR}/bash/config";
	source "${UNIXCONFDIR}/bash/aliases";
	source "${UNIXCONFDIR}/bash/env";
	source "${UNIXCONFDIR}/bash/radio";
}

reload;
