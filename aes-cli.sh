#!/bin/bash

# aes-cli.sh — AES-256-CBC encryption and decryption tool using OpenSSL

function usage() {
    echo "Usage:"
    echo "  $0 encrypt \"your text\" \"password\""
    echo "  $0 decrypt \"base64 ciphertext\" \"password\""
    echo ""
    echo "Optional environment variable:"
    echo "  ITER=100000     # Set PBKDF2 iterations (default: 100000)"
}

# Set default iteration count
ITER=${ITER:-100000}

if [ "$#" -ne 3 ]; then
    usage
    exit 1
fi

MODE="$1"
DATA="$2"
PASS="$3"

case "$MODE" in
    encrypt)
        echo -n "$DATA" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter "$ITER" -pass pass:"$PASS"
        ;;
    decrypt)
        echo "$DATA" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -iter "$ITER" -pass pass:"$PASS"
        ;;
    *)
        echo "Unknown mode: $MODE"
        usage
        exit 1
        ;;
esac
