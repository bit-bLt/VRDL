
# Purpose

Sets up device to work as dedicated server for Splinter Cell Chaos Theory Versus 

# Configuration

Look to env vars in .env

# Install

as root:

```./vrdl-install```


# What the script does

TLDR; the dedicated server instance(s) runs underneath headless Sway and Xwayland.

- Updates server
- Creates standard user 
- Installs required dependancies
- Downloads the game files
- Creates systemd services to start server instances on boot
- Configures 1x1 virtual display in Sway (this seems to work, and lowers memory footprint)
- Provides status script to output the window title of the dedicated server cmd window (holds fps and player count stat)
- Provides monitor script to "watch" the status script

# Support

Currently only supports Ubuntu Server 24.04

