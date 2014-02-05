#!/usr/bin/env awk

{
	CMD[$2]++;
	count++;
}

END {
	for (a in CMD)
		print CMD[a] " " (CMD[a] / count * 100) "% " a;
}

