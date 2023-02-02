#! /bin/bash
# $1 host $2 remote to transfer, $3 local to store transfers, $4 will be local to transfer, $5 remote store transfer

sftp $1 << EOF
get -r $2 $3
put -r $4 $5
exit
EOF