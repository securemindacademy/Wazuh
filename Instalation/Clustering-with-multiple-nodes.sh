# SSH to one of the node (Manager Node)
curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh
curl -sO https://packages.wazuh.com/4.7/config.yml
ll
vim config.yml
sudo bash wazuh-install.sh --generate-config-files
ll

sudo scp -i securemindacademy_sshkey wazuh-install* securemindacademy@wzworkernode.securemindacademy.com:/home/securemindacademy/
sudo scp -i securemindacademy_sshkey wazuh-install* securemindacademy@wzindexernode01.securemindacademy.com:/home/securemindacademy/
sudo scp -i securemindacademy_sshkey wazuh-install* securemindacademy@wzindexernode02.securemindacademy.com:/home/securemindacademy/
sudo scp -i securemindacademy_sshkey wazuh-install* securemindacademy@wzindexernode03.securemindacademy.com:/home/securemindacademy/
sudo scp -i securemindacademy_sshkey wazuh-install* securemindacademy@wzdashboard.securemindacademy.com:/home/securemindacademy/


# SSH to Indexer node 1 server
ll
# -i to ignore hardware warning
sudo bash wazuh-install.sh --wazuh-indexer node-1 -i

# SSH to Indexer node 2 server
ll
# -i to ignore hardware warning
sudo bash wazuh-install.sh --wazuh-indexer node-2 -i

# SSH to Indexer node 3 server
ll
# -i to ignore hardware warning
sudo bash wazuh-install.sh --wazuh-indexer node-3 -i

## Wait to done the setup on all indexer nodes
# Access to any indexer server (Indexer01)
sudo bash wazuh-install.sh --start-cluster

sudo tar -axf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt -O | grep -P "\'admin\'" -A 1

  #indexer_username: 'admin'
  #indexer_password: '7itxMJeEFteQ8XNJ4dbcNE3rA.i9tuST'

curl -k -u admin:7itxMJeEFteQ8XNJ4dbcNE3rA.i9tuST https://wzindexernode01.securemindacademy.com:9200
curl -k -u admin:7itxMJeEFteQ8XNJ4dbcNE3rA.i9tuST https://wzindexernode02.securemindacademy.com:9200/_cat/nodes?v
curl -k -u admin:7itxMJeEFteQ8XNJ4dbcNE3rA.i9tuST https://wzindexernode03.securemindacademy.com:9200/_cat/nodes?v

# Access to Manager Node
sudo bash wazuh-install.sh --wazuh-server wazuh-1

# Access to WORKER Node
sudo bash wazuh-install.sh --wazuh-server wazuh-2

# Access to Dashboard node
# -i to ignore hardware warning
sudo bash wazuh-install.sh --wazuh-dashboard dashboard -i
