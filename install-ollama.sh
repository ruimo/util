#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で十分の容量のあるデバイスのディレクトリを指定してください(例: /mnt/vdd1/ollama)"
  exit 1
fi

DIR="$1"
sudo mkdir -p "$DIR"
sudo chown ollama:ollama "$DIR"
sudo ln -s "$DIR" /usr/share/ollama

curl -fsSL https://ollama.com/install.sh | sh
