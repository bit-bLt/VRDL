setup_systemd() {

## Systemd service creation

	service_content=$(cat <<-EOF
		[Unit]
		Description=Service for starting and starting SCCT:V R/E Dedicated Servers
		BindsTo=default.target
		Wants=default.target
		After=default.target

		[Service]
		Type=simple
		User="$VRDL_STANDARD_USER"
		ExecStart=sh "$VRDL_SCRIPTS_PATH/$VRDL_START"
		ExecStop=pkill sway
		ExecStop=pkill "$VRDL_RUNNER"
		PAMName=Login
		Restart=on-failure
		RestartSec=1
		TimeoutStopSec=10
		KillMode=control-group

		[Install]
		WantedBy=default.target
	EOF
	)

	# Remove existing service if found
	if [ -e "/etc/systemd/system/$VRDL_SERVICE_NAME.service" ]; then
		log 0 "Removing old existing services ..."
		systemctl stop "$VRDL_SERVICE_NAME"
		systemctl disable "$VRDL_SERVICE_NAME"
		rm "/etc/systemd/system/$VRDL_SERVICE_NAME.service"
	fi

	log 0 "Creating Systemd service ..."
	
	echo "$service_content" > "/etc/systemd/system/${VRDL_SERVICE_NAME}.service"
	
	log 0 "Reloading Systemd service daemon ..."
	systemctl daemon-reload

	# Enable systemd service

	result=$(prompt "Enable systemd service (auto start on boot)? (y/n)")

	if [ $result = "y" ]; then
		log 0 "Enabling Service ..."
		systemctl enable "$VRDL_SERVICE_NAME"
	fi
}
