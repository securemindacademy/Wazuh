#############################################################
#  ____  _____ ____ _   _ ____  _____ __  __ ___ _   _ ____  
# / ___|| ____/ ___| | | |  _ \| ____|  \/  |_ _| \ | |  _ \ 
# \___ \|  _|| |   | | | | |_) |  _| | |\/| || ||  \| | | | |
#  ___) | |__| |___| |_| |  _ <| |___| |  | || || |\  | |_| |
# |____/|_____\____|\___/|_| \_\_____|_|_ |_|___|_| \_|____/ 
#          / \  / ___|  / \  |  _ \| ____|  \/  \ \ / /      
#         / _ \| |     / _ \ | | | |  _| | |\/| |\ V /       
#        / ___ \ |___ / ___ \| |_| | |___| |  | | | |        
#       /_/   \_\____/_/   \_\____/|_____|_|  |_| |_|        

sudo apt install auditd -y

# sudo vim /etc/audit/rules.d/command_logging.rules
sudo echo -e "-a exit,always -F arch=b64 -S execve -k  audit-wazuh-c\n-a exit,always -F arch=b32 -S execve -k  audit-wazuh-c" | sudo tee /etc/audit/rules.d/command_logging.rules > /dev/null

auditctl -l

systemctl restart auditd

auditctl -l
