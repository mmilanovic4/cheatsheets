#!/bin/bash
#
# Run Apache web-server in the foreground

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
