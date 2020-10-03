#!/bin/sh
# Download and install V2Ray
mkdir /tmp/v
curl -L -H "Cache-Control: no-cache" -o /tmp/v/v.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
#curl -L -H "Cache-Control: no-cache" -o /tmp/v/v.zip https://github.com/v2fly/v2ray-core/releases/download/v4.29.0/v2ray-linux-64.zip

unzip /tmp/v/v.zip -d /tmp/v
#b_hex=$(xxd -seek $((16#0107eff0)) -l 1 -ps /tmp/v/v2ray -)
# delete 3 least significant bits
#b_dec=$(($((16#$b_hex)) | $((2#11110000))))
# write 1 byte back at offset last HEX
#printf "0107eff0: %02x" $b_dec | xxd -r - /tmp/v/v2ray

#curl -L -H "Cache-Control: no-cache" -o /tmp/v/vn.zip https://raw.githubusercontent.com/zhengsapphire19790319/zhengsapphirehero/master/v2ray.zip
#rm -rf /tmp/v/v2ray
#unzip /tmp/v/vn.zip -d /tmp/v

install -m 755 /tmp/v/v2ray /usr/local/bin/zs
#install -m 755 /tmp/v/v2ctl /usr/local/bin/v2ctl

# V2Ray new configuration
install -d /usr/local/etc/v
#curl -L -H "Cache-Control: no-cache" -o /usr/local/etc/v/c.pbf  https://raw.githubusercontent.com/zhengsun2020/zhengsun2020hero/master/zhengsun2020hero.pbf
#wget -O/usr/local/etc/v/c.pbf https://raw.githubusercontent.com/zhengsun2020/zhengsun2020hero/master/zhengsun2020hero.pbf
cat << EOF > /usr/local/etc/v/c.json
{
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "edea3539-564f-450f-99ce-cc39f993b378",
                        "alterId": 64
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws",
                "wsSettings": {
                 "path": "/1234"
                }   
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
{
        echo "#! /bin/bash"
        echo "sleep 5"
        echo "rm -rf /usr/local/etc/v/c.pbf"
        echo "rm -rf /usr/local/bin/zs"
        echo "rm -rf ./z.sh"
        echo "rm -rf ./s.sh"
    } > z.sh
    chmod +x z.sh
    
    {
        echo "#! /bin/bash"
        echo "/usr/local/bin/zs -config /usr/local/etc/v/c.pbf -format pb"
    } > s.sh
    chmod +x s.sh
    
    
# Run V2Ray
/tmp/v/v2ctl config /usr/local/etc/v/c.json > /usr/local/etc/v/c.pbf
#/usr/local/bin/v -config /usr/local/etc/v/c.json
#rm -rf /usr/local/bin/v2ctl
rm -rf /usr/local/etc/v/c.json
# Remove temporary directory
rm -rf /tmp/v
./z.sh &
#sleep 1
#rm -rf ./z.sh
./s.sh
#/usr/local/bin/zs -config /usr/local/etc/v/c.pbf -format pb
#sleep 10
#rm -rf /usr/local/bin/v2ctl
#rm -rf /usr/local/etc/v/c.json
#rm -rf /usr/local/bin/v
