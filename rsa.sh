#!/bin/bash

# Step 1: Generate two large prime numbers
p=71
q=59

# Step 2: Calculate n
n=$(($p * $q))

# Step 3: Calculate the totient function of n
phi=$(($(($p - 1)) * $(($q - 1))))

# Step 4: Choose an encryption exponent e
e=13

# Step 5: Calculate the decryption exponent d
d=$(($(($e ** -1)) % $phi))

# Step 6: Generate the public and private keys
public_key="$n:$e"
private_key="$n:$d"

# Step 7: Implement encryption and decryption
function encrypt {
  plaintext=$1
  echo $(($plaintext ** $e % $n))
}

function decrypt {
  ciphertext=$1
  echo $(($ciphertext ** $d % $n))
}

# Example usage
plaintext=123
echo "Plaintext: $plaintext"

ciphertext=$(encrypt $plaintext)
echo "Ciphertext: $ciphertext"

decrypted_text=$(decrypt $ciphertext)
echo "Decrypted text: $decrypted_text"
