#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で十分の容量のあるデバイスのディレクトリを指定してください(例: /mnt/vdd1/ollama)"
  exit 1
fi

curl -fsSL https://ollama.com/install.sh | sh

DIR="$1/models"
sudo sed -i "/^Environment.*PATH.*$/a Environment=\"OLLAMA_MODELS=$DIR\"" /etc/systemd/system/ollama.service
sudo mkdir -p "$DIR"
sudo chown ollama:ollama "$DIR"
sudo systemctl daemon-reload
sudo systemctl start ollama
