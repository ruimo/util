#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で十分の容量のあるデバイスのディレクトリを指定してください(例: /mnt/vdd1/ollama)"
  exit 1
fi

curl -fsSL https://ollama.com/install.sh | sh

dir="$1/models"
line_to_add="Environment=OLLAMA_MODELS=$dir"
sudo sed -i "/^Environment=.*/a ${line_to_add}" /etc/systemd/system/ollama.service
sudo mkdir -p "$dir"
sudo chown ollama:ollama "$dir"
sudo systemctl daemon-reload
sudo systemctl start ollama
