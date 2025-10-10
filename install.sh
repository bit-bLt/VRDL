#!/bin/sh

## Set env vars 

. ./.env

## Func includes

. functions/prompt.sh
. functions/log.sh
. functions/setup-users.sh
. functions/setup-os-packages.sh
. functions/setup-fs.sh
. functions/setup-content.sh
. functions/setup-service.sh
. functions/setup-wine.sh

echo "|    $(date)    |" >> "$VRDL_LOG_FILE"
log 0 "Begin ..."

printf "\n"

setup_os_packages
setup_users
setup_fs
setup_content
setup_wine
setup_service

### Finalize


## Band-aid fix; dedi auto process needs at least one profile to exist
# or profile selection is presented

log 0 "Creating null_prf.ini to fix automation bug ..."
scctv_profile_dir="$VRDL_WINE_PREFIX_PATH/drive_c/ProgramData/Ubisoft/Tom Clancy's Splinter Cell Chaos Theory/Saved Games/Versus"
su "$VRDL_STANDARD_USER" -c "mkdir -p \"$scctv_profile_dir\""
su "$VRDL_STANDARD_USER" -c "touch \"$scctv_profile_dir\"/null_prf.ini"

## Disable unattended upgrades

result=$(prompt "Remove unattended upgrades (Ubuntu auto, background server updates)? (y/n)")

if [ $result = "y" ]; then
	log 0 "Removing unattended-upgrades ..."
	apt remove unattended-upgrades -y
fi

## Ensure dirs owned by standard user

chown "$VRDL_STANDARD_USER":"$VRDL_STANDARD_USER" "$VRDL_BASE_PATH" -R

## Reboot

echo "A reboot is recommended"
result_rb=$(prompt "Reboot now? (y/n)")

log 0 "Finished!"

if [ $result_rb = "y" ]; then
	echo "Rebooting ..."
	sleep 2
	reboot
fi

