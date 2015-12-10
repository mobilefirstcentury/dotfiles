sudo sh -c "iptables-save > /etc/iptables/rules.v4"   #sudo and redirection >
echo 'iptables-save > /etc/iptables/rules.v4' | sudo bash #sudo and redirection >
sudo iptables-save|sudo tee /etc/iptables/rules.v4 >/dev/null #sudo and redirection >

sudo command | sudo dd of=FILENAME # Pipe avec sudo sans redirection stdout
sudo command | sudo tee FILENAME   # Pipe avec sudo et redirection stdout
