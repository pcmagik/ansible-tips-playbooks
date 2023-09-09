#!/bin/bash

# Aby użyć tego skryptu:

# Zapisz go w pliku, na przykład remove_ssh_keys.sh.
# Nadaj mu prawa do wykonania, używając polecenia: chmod +x remove_ssh_keys.sh.
# Uruchom skrypt, wpisując: ./remove_ssh_keys.sh.
# Skrypt ten iteruje przez listę adresów IP i dla każdego z nich wykonuje polecenie ssh-keygen z odpowiednimi opcjami, aby usunąć klucz z pliku known_hosts.

# Definiujemy tablicę z adresami IP
IP_ADDRESSES=(
  "192.168.1.71"
  "192.168.1.72"
  "192.168.1.73"
  "192.168.1.74"
  "192.168.1.75"
)

# Iterujemy przez każdy adres IP i usuwamy odpowiedni klucz
for IP in "${IP_ADDRESSES[@]}"; do
  ssh-keygen -f "/home/pcmagik/.ssh/known_hosts" -R "$IP"
done

# Informujemy użytkownika, że skrypt zakończył działanie
echo "Usunięto klucze dla wszystkich adresów IP."
