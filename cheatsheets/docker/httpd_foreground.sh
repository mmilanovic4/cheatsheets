#!/bin/bash
#
# Покретање Апач Веб-сервера у позадини

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
