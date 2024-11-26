#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数でLLM格納されたディレクトリを指定してください"
  exit 1
fi

cd "$1"
echo "FROM ." > Modelfile
ollama create --quantize q8_0 pli-llm
