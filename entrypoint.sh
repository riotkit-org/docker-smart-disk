#!/bin/bash

echo "0 3 * * * root smartctl -t short ${DISK}" > /etc/cron.d/smart
exec cron -f
