#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で十分の容量のあるデバイスのディレクトリを指定してください(例: /mnt/vdd1/ollama)"
  exit 1
fi

curl -fsSL https://ollama.com/install.sh | sh

line_to_add="Environment=OLLAMA_MODELS=$1/models"
sudo sed -i "/^Environment=.*/a ${line_to_add}" /etc/systemd/system/ollama.service
sudo mkdir -f $1
sudo chown ollama:ollama $1
sudo systemctl daemon-reload
sudo systemctl start ollama
