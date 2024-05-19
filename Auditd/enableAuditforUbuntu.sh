sudo apt install auditd -y

# sudo vim /etc/audit/rules.d/command_logging.rules
sudo echo -e "-a exit,always -F arch=b64 -S execve -k  audit-wazuh-c\n-a exit,always -F arch=b32 -S execve -k  audit-wazuh-c" | sudo tee /etc/audit/rules.d/command_logging.rules > /dev/null

auditctl -l

systemctl restart auditd

auditctl -l
