#!/bin/bash

ITER=${ITER:-100000}

function usage() {
    echo "Usage:"
    echo "  $0 encrypt   # Encrypt input text"
    echo "  $0 decrypt   # Decrypt base64 ciphertext"
    echo ""
    echo "Optional environment variable:"
    echo "  ITER=200000  # Set PBKDF2 iterations"
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

CMD="$1"

case "$CMD" in
    encrypt)
        echo "🔐 AES-256-CBC Encrypt (OpenSSL + pbkdf2)"
        echo "-----------------------------------------"
        read -s -p "Enter password: " PASS
        echo
        echo -n "Enter text to encrypt: "
        IFS= read -r INPUT
        echo
        echo "Encrypting..."
        echo -n "$INPUT" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter "$ITER" -pass pass:"$PASS"
        echo
        ;;

    decrypt)
        echo "🔓 AES-256-CBC Decrypt (OpenSSL + pbkdf2)"
        echo "-----------------------------------------"
        read -s -p "Enter password: " PASS
        echo
        echo -n "Enter base64 ciphertext to decrypt: "
        IFS= read -r INPUT
        echo
        echo "Decrypting..."
        echo "$INPUT" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -iter "$ITER" -pass pass:"$PASS"
        echo
        ;;

    *)
        usage
        exit 1
        ;;
esac
