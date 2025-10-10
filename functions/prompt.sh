prompt() {
	local response=""

	while [ "$response" != "y" ] && [ "$response" != "n" ]; do
		echo -n "$1 (y/n) > " >&2
		read response
	done

	echo $response
}
