#!/bin/sh

if [ $# -ne 1 ]; then
  echo "引数で初期化したいデバイスを1つ指定してください(例: vdd)"
  echo "デバイス名は、lsblkコマンドで確認できます"
  exit 1
fi

parted -s /dev/vdd mklabel gpt
parted -s /dev/vdd mkpart primary ext4 0% 100%

mkfs.ext4 /dev/vdd1

mkdir /mnt/vdd1

mount /dev/vdd1 /mnt/vdd1

echo "/dev/vdd1 /mnt/vdd1 ext4 defaults 0 0" >> /etc/fstab
