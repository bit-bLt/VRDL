setup_users() {
	## Create Standard User

	if id "$VRDL_STANDARD_USER" >/dev/null 2>&1; then
		log 0 "Standard user "$VRDL_STANDARD_USER" already exists"
	
	else
		log 0 "Adding user: $VRDL_STANDARD_USER ..."
	
		useradd "$VRDL_STANDARD_USER" -m # -m home dir benefits certain processes, such as font cache
		log 0 "Standard User Provisioned"
	fi
}
