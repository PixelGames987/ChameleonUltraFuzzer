#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Usage: $0 <slot> <keyfile> <delay>" >&2
    exit 1
fi
SLOT="$1"
KEYFILE="$2"
DELAY="$3"
(
    echo "hw connect"
    echo "hw slot change -s $SLOT"
    sleep 5
    while IFS= read -r key || [ -n "$key" ]; do
        echo "lf em 410x econfig -s $SLOT --id $key"
        sleep $DELAY
    done < "$KEYFILE"
) | ChameleonUltra/software/script/venv/bin/python3 ChameleonUltra/software/script/chameleon_cli_main.py
echo "Script completed."
