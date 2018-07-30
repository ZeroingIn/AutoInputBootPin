#!/system/bin/sh
MODDIR=${0%/*}
#encryption detection
# [ $(getprop ro.crypto.state) = "encrypted" ] || echo "unencrypted"
#boot detection
until [ $(getprop init.svc.bootanim) = "stopped" ]
do
sleep 2
done

# 7 -->  "KEYCODE_0" 48
# 16 -->  "KEYCODE_9" 57
# 66 -->  "KEYCODE_ENTER"

#convert char to keyCode
# function convert()
# {
#     #A-Za-z0-9
#     char=$1
#     charASCII=$( printf "%d" "'${char}" )
#     keyCode=$((10#${charASCII}-41))
#     echo $keyCode
#     return $keyCode
# }

source /data/AutoInputBootPIN/config
#input sim 1 pin
# for i in `seq 1 ${#PIN1}`
# do
# c=${PIN1:$i-1:1}
# echo $c
# code=$(convert $c)
# input keyevent $code
# done
sleep 2
input text $PIN1
input keyevent 66
sleep $TimeInterval

#input sim 2 pin
# for i in `seq 1 ${#PIN2}`
# do
# c=${PIN2:$i-1:1}
# echo $c
# code=$(convert $c)
# input keyevent $code
# done
input text $PIN2
input keyevent 66
sleep $TimeInterval

#input phone pin
# for i in `seq 1 ${#PIN3}`
# do
# c=${PIN3:$i-1:1}
# echo $c
# code=$(convert $c)
# input keyevent $code
# done
input text $PIN3
input keyevent 66