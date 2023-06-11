#!/bin/bash

# Function to generate a random password using /dev/urandom
function generate_password_urandom() {
  local length=$1
  local characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-+=<>?{}"
  local password=$(head /dev/urandom | tr -dc "$characters" | head -c "$length")
  echo "Random password generated using /dev/urandom: $password"
}

# Prompt the user to enter the password length
read -p "Enter the password length: " length

# Call the generate_password_urandom function with the provided length as input
generate_password_urandom "$length"

