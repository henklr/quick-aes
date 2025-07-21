# quick-aes


# ================= WITHOUT SCRIPT ================= #
# Encrypt
echo -n "hello world" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:1234

# Decrypt
echo "YOUR_ENCRYPTED_STRING" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -pass pass:1234

# With iterations
echo -n "hello world" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter 100000 -pass pass:1234



# ================= WITH SCRIPT ================= #

# make executable
chmod +x aes-cli.sh

# encrypt
./aes-cli.sh encrypt "my secret text" "mypassword"

# output
U2FsdGVkX1/4x4e+yA2k1CdazQzgyEjMkgzWz6Xw8b8=

# decrypt
./aes-cli.sh decrypt "U2FsdGVkX1/4x4e+yA2k1CdazQzgyEjMkgzWz6Xw8b8=" "mypassword"

# output
my secret text

# optional: set iteration count
ITER=200000 ./aes-cli.sh encrypt "important message" "supersecurepass"