#!/bin/bash

# proxmox uses (now) min and non min version for pve and pbs

PATTERN=nag_screen_removed

FILENAME=/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
if grep -q ${PATTERN} "${FILENAME}"; then
        echo doing nothing: ${FILENAME}
else
        cp "${FILENAME}" "${FILENAME}.backup"
        #sed -i.backup -z "s/res === null || res === undefined || \!res || res\n\t\t\t.data.status.toLowerCase() \!== 'active'/false/g" ${FILENAME}
        sed -i.backup -zE 's@if\s*\([^)]*res\.data\.status\.toLowerCase\(\)[^)]*\)@if (false)@g' "${FILENAME}"
        if diff "${FILENAME}.backup" "${FILENAME}" > /dev/null; then
                echo "error: backup and patched files are identical - file: ${FILENAME}"
                exit 1
        fi
        # mark as fixed
        echo "//${PATTERN}" >> "${FILENAME}"
        echo patched file: ${FILENAME}
fi

FILENAME=/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.min.js
if grep -q ${PATTERN} "${FILENAME}"; then
        echo doing nothing: ${FILENAME}
else
        cp "${FILENAME}" "${FILENAME}.backup"
        #sed -i.backup -z "s/null=\!e||\!e.data||\"active\"\!==e.data.status.toLowerCase()/false/g" ${FILENAME}
        sed -i.backup -zE "s/null\s*!=\s*e\s*&&\s*e\s*&&\s*\"active\"\s*===\s*e\.data\.status\.toLowerCase\(\)/false/g" ${FILENAME}
        if diff "${FILENAME}.backup" "${FILENAME}" > /dev/null; then
                echo "error: backup and patched files are identical - file: ${FILENAME}"
                exit 1
        fi
        # mark as fixed
        echo "//${PATTERN}" >> "${FILENAME}"
        echo patched file: ${FILENAME}
fi
