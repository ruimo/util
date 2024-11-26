#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で十分の容量のあるデバイスのディレクトリ1つ指定してください(例: /mnt/vdd1/ollama)"
  exit 1
fi

OLLAMA_MODELS="$1" curl -fsSL https://ollama.com/install.sh | sh
