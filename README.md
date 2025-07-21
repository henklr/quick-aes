# quick-aes


# ================= ONELINERS ================= #
# Encrypt
echo -n "hello world" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:1234

# Decrypt
echo "YOUR_ENCRYPTED_STRING" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -pass pass:1234

# With iterations
echo -n "hello world" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter 100000 -pass pass:1234


# ================= SCRIPTS ================= #

# Make executable
chmod +x aes.sh

# Encrypt 
./aes.sh encrypt

# Decrypt
./aes.sh decrypt