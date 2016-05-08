#!/bin/bash
# tomato Script Starts here
function tomato_lock () {
read -n1 -p "Relock Bootloader? [y,n]" doit
input=$doit
for (( c=1; c==1; ))
do
if [[ $input == "Y" || $input == "y" ]]; then
sudo fastboot -i 0x1ebf oem lock 
printf "\nBootloader locked"
c=0
tomato_reboot
elif [[ $input == "n" || $input == "n" ]]; then
        printf  "\nBootloader alredy unlocked\n"
c=0
tomato_reboot
else
printf "\nEnter valid input\n"
tomato_lock
fi
done
}
function tomato_flash () {
echo "---------------------[ Start flashing ROM ]-------------------------"
echo "----------------[ Checking for connected devices ]------------------"
sudo fastboot -i 0x1ebf devices 
echo "-------------------[ Unlocking bootloader ]-------------------------"
sudo fastboot -i 0x1ebf oem unlock 
echo "---------------[ Flashing modem and bootloader ]--------------------"
sudo fastboot -i 0x1ebf flash aboot emmc_appsboot.mbn
sudo fastboot -i 0x1ebf flash modem NON-HLOS.bin
sudo fastboot -i 0x1ebf flash rpm rpm.mbn
sudo fastboot -i 0x1ebf flash sbl1 sbl1.mbn
sudo fastboot -i 0x1ebf flash tz tz.mbn
sudo fastboot -i 0x1ebf flash hyp hyp.mbn
echo "----------------------[ Flashing kernel ]---------------------------"
sudo fastboot -i 0x1ebf flash boot boot.img
echo "----------------------[ Flashing recovery ]-------------------------"
sudo fastboot -i 0x1ebf flash recovery recovery.img
echo "-------------------[ Flashing system partition ]--------------------"
sudo fastboot -i 0x1ebf flash system system.img
echo "-------------------[ Flashing data partition ]----------------------"
sudo fastboot -i 0x1ebf flash userdata userdata.img
tomato_lock
}
function tomato_reboot () {
echo "---------------------[ Rebooting device ]---------------------------"
sudo fastboot -i 0x1ebf reboot
echo "-------------------------[ Success!! Enjoy!! ]-------------------------------"
}
# tomato script ends here..
# sambar Script Starts here
function sambar_lock () {
read -n1 -p "Relock Bootloader? [y,n]" doit
input=$doit
for (( c=1; c==1; ))
do
if [[ $input == "Y" || $input == "y" ]]; then
sudo fastboot -i 0x2A96 oem lock
printf "\nBootloader locked"
c=0
sambar_reboot
elif [[ $input == "n" || $input == "n" ]]; then
        printf  "\nBootloader alredy unlocked\n"
c=0
sambar_reboot
else
printf "\nEnter valid input\n"
sambar_lock
fi
done
}
function sambar_flash () {
echo "---------------------[ Start flashing ROM ]-------------------------"
echo "----------------[ Checking for connected devices ]------------------"
sudo fastboot -i 0x2A96 devices 
echo "-------------------[ Unlocking bootloader ]-------------------------"
sudo fastboot -i 0x2A96 oem unlock 
echo "----------------------[ Flashing kernel ]---------------------------"
sudo fastboot -i 0x2A96 flash boot boot.img
echo "---------------[ Flashing modem and bootloader ]--------------------"
sudo fastboot -i 0x2A96 flash aboot emmc_appsboot.mbn
sudo fastboot -i 0x2A96 flash modem NON-HLOS.bin
sudo fastboot -i 0x2A96 flash rpm rpm.mbn
sudo fastboot -i 0x2A96 flash sbl1 sbl1.mbn
sudo fastboot -i 0x2A96 flash tz tz.mbn
sudo fastboot -i 0x2A96 flash sdi sdi.mbn
sudo fastboot -i 0x2A96 flash pmic pmic.mbn
sudo fastboot -i 0x2A96 flash bluetooth BTFM.bin
sudo fastboot -i 0x2A96 flash hyp hyp.mbn
sudo fastboot -i 0x2A96 flash splash splash.img
echo "-------------------[ Flashing cache partition ]---------------------"
sudo fastboot -i 0x2A96 flash cache cache.img
echo "-------------------[ Flashing data partition ]----------------------"
sudo fastboot -i 0x2A96 flash userdata userdata.img
echo "-------------------[ Flashing system partition ]--------------------"
sudo fastboot -i 0x2A96 flash system system.img
echo "----------------------[ Flashing recovery ]-------------------------"
sudo fastboot -i 0x2A96 flash recovery recovery.img
sambar_lock
}
function sambar_reboot () {
echo "---------------------[ Rebooting device ]---------------------------"
sudo fastboot -i 0x2A96 reboot
echo "-------------------------[ Success!! Enjoy!! ]-------------------------------"
}
# sambar script ends here..
# lettuce Script Starts here
function lettuce_lock () {
read -n1 -p "Relock Bootloader? [y,n]" doit
input=$doit
for (( c=1; c==1; ))
do
if [[ $input == "Y" || $input == "y" ]]; then
printf "\nBootloader locked"
sudo fastboot -i 0x2A96 oem lock 
c=0
lettuce_reboot
elif [[ $input == "n" || $input == "n" ]]; then
        printf  "\nBootloader alredy unlocked\n"
c=0
lettuce_reboot
else
printf "\nEnter valid input\n"
lettuce_lock
fi
done
}
function lettuce_flash () {
echo "---------------------[ Start flashing ROM ]-------------------------"
echo "----------------[ Checking for connected devices ]------------------"
sudo fastboot -i 0x2A96 devices 
echo "-------------------[ Unlocking bootloader ]-------------------------"
sudo fastboot -i 0x2A96 oem unlock 
echo "----------------------[ Flashing kernel ]---------------------------"
sudo fastboot -i 0x2A96 flash boot boot.img
echo "---------------[ Flashing modem and bootloader ]--------------------"
sudo fastboot -i 0x2A96 flash aboot emmc_appsboot.mbn
sudo fastboot -i 0x2A96 flash modem NON-HLOS.bin
sudo fastboot -i 0x2A96 flash rpm rpm.mbn
sudo fastboot -i 0x2A96 flash sbl1 sbl1.mbn
sudo fastboot -i 0x2A96 flash tz tz.mbn
sudo fastboot -i 0x2A96 flash hyp hyp.mbn
sudo fastboot -i 0x2A96 flash splash splash.img
echo "-------------------[ Flashing cache partition ]---------------------"
sudo fastboot -i 0x2A96 flash cache cache.img
echo "-------------------[ Flashing data partition ]----------------------"
sudo fastboot -i 0x2A96 flash userdata userdata.img
echo "-------------------[ Flashing system partition ]--------------------"
sudo fastboot -i 0x2A96 flash system system.img
echo "----------------------[ Flashing recovery ]-------------------------"
sudo fastboot -i 0x2A96 flash recovery recovery.img
lettuce_lock
}
function lettuce_reboot () {
echo "---------------------[ Rebooting device ]---------------------------"
sudo fastboot -i 0x2A96 reboot
echo "-------------------------[ Success!! Enjoy!! ]-------------------------------"
}
# lettuce script ends here..
# main script starts here..
function  device_select () {
printf "\n Select your device\n1 for Yureka\n2 for Yuphoria\n3 for Yutopia\n"
answer=0
read answer
device=$answer
for (( count=1; count==1; ))
do
if [ $device = 1 ]; then
printf "\nYureka selected\n"
count=0
tomato_flash
elif [ $device = 2 ]; then
        printf  "\nYuphoria Selected\n"
count=0
lettuce_flash
elif [ $device = 3 ]; then
        printf  "\nYutopia Selected\n"
count=0
sambar_flash
else
printf "\nEnter valid input\n"
device_select
fi
done
}
# Installing fastboot
sudo apt-get update
sudo apt-get install fastboot
clear
printf "\n --------------------[ Yu devices ROM flasher ]---------------------------\n -------------------------[ Written by 33 ]-------------------------------\n"
device_select
