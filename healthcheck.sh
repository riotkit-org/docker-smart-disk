#!/bin/bash

if [[ ! -e "${DISK}" ]]; then
    echo "No disk specified, or invalid disk specified"
    exit 1
fi

output=$(smartctl -a ${DISK})

if [[ "${output}" != *"No Errors Logged"* ]]; then
    echo "It seems that the disk may require attention"
    exit 1
fi

exit 0
