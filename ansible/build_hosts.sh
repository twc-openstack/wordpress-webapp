#!/bin/bash

OUTFILE="${1-hosts}"
rm -f ${OUTFILE}
echo "[galera]" >> ${OUTFILE}
nova list | grep backend | awk '{ print $4 " ansible_ssh_host="$13 " ansible_ssh_user=ubuntu" }' | tr -d ',' >> ${OUTFILE}
echo "" >> ${OUTFILE}
echo "[wordpress]" >> ${OUTFILE}
nova list | grep frontend | awk '{ print $4 " ansible_ssh_host="$13 " ansible_ssh_user=ubuntu" }' | tr -d ',' >> ${OUTFILE}

