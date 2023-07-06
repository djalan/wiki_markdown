# OpenWRT

## Factory reset on DIR-859
- assign IP manually
    - 192.168.1.2    255.255.255.0    192.168.1.1
- unplug Ethernet cables except yours and put it on Port #1
- hold reset button for 10 seconds

## ash
Does not support process substitution
Instead of `<(command)`, create a file with the content just before

## IP filter for port forwards
```bash
#!/bin/bash

CONFIG_FILE='/etc/config/alain-port-forwards-ip.conf'
CONFIG_LINES='/tmp/alain-port-forwards-ip.lines'
LOG='/var/log/alain-port-forwards-ip.log'
CHANGES=false
RULES_TOTAL=$(\
    uci show firewall | grep -F 'firewall.@redirect[' \
    | sed -E -n 's/[^\[]+\[([0-9]+)\].+/\1/p' | sort -u | tail -n 1)
INDICES=($(seq 0 1 $RULES_TOTAL))
PROCESSED_INDICES=()
REMAINING_INDICES=${INDICES[@]}

grep -E -v "^#|^$" $CONFIG_FILE > $CONFIG_LINES

while read LINE; do
    NAME_EXPECTED=$(echo $LINE | awk 'BEGIN{ORS=""} {print $1}')

    # echo "remaining indices ${REMAINING_INDICES[@]}"
    for INDEX in ${REMAINING_INDICES[@]}; do
        NAME_ACTUAL=$(uci get firewall.@redirect[${INDEX}].name)

        if [[ $NAME_ACTUAL = $NAME_EXPECTED ]]; then
            URL=$(echo $LINE | awk 'BEGIN{ORS=""} {print $2}')
            SRC_IP=$(uci get firewall.@redirect[${INDEX}].src_ip) || SRC_IP=no-attribute

            # -type=a IPv4
            # -type=aaaa IPv6
            # default will output both
            NSLOOKUP=$(nslookup -type=a $URL)
            if [[ $? -ne 0 ]]; then
                echo "$(date) nslookup failed for $URL" >> $LOG
                exit 1
            fi
            DNS_IP=$(echo "$NSLOOKUP" | grep -A 1 'Name:' | awk '/Address/ {print $NF}')

            if [[ "$SRC_IP" != "$DNS_IP" ]]; then
                uci set firewall.@redirect[${INDEX}].src_ip=${DNS_IP}
                printf "%-31s %-30s %-16s %s\n" "$(date)" $NAME_EXPECTED $SRC_IP $DNS_IP >> $LOG
                CHANGES=true
            fi

            PROCESSED_INDICES+=("$INDEX")
            # echo "processed array ${PROCESSED_INDICES[@]}"
            REMAINING_INDICES=($(printf '%s\n' "${INDICES[@]}" "${PROCESSED_INDICES[@]}" | sort | uniq -u))
            break
        fi
    done
done < $CONFIG_LINES

if [[ $CHANGES = true ]]; then
    uci commit firewall
    /etc/init.d/firewall restart
fi
```
