# Jednakże, jeśli chcesz, aby automatycznie potwierdzało "yes" tylko dla polecenia ssh, możesz użyć polecenia ssh-keyscan do dodania klucza hosta do pliku known_hosts przed uruchomieniem playbooka. Oto jak możesz to zrobić:

#!/bin/bash

# Lista adresów IP hostów
HOSTS=("192.168.1.71" "192.168.1.72" "192.168.1.73" "192.168.1.74" "192.168.1.75")

# Dodajemy klucze hostów do pliku known_hosts
for HOST in "${HOSTS[@]}"; do
  ssh-keyscan -H $HOST >> ~/.ssh/known_hosts
done

# Uruchamiamy playbook
# ansible-playbook site.yml -i inventory/my-cluster/hosts.ini
# W tym skrypcie:
# Używamy ssh-keyscan do skanowania i dodawania kluczy hostów do pliku known_hosts.
# Następnie uruchamiamy playbook Ansible.
# Zapisz skrypt w pliku (na przykład run_playbook.sh), nadaj mu prawa do wykonania (chmod +x run_playbook.sh) i uruchom go (./run_playbook.sh).
# Ostrzeżenie: Automatyczne akceptowanie kluczy hostów może zwiększyć ryzyko ataków "man-in-the-middle". Używaj tej metody tylko w zaufanych sieciach i gdy jesteś pewien, że hosty są bezpieczne.
