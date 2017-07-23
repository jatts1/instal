#!/bin/bash
#wget -O menu-install.sh http://boedaxbayah-vpn.com/menu-install.sh && chmod +x menu-install.sh && ./menu-install.sh

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="https://raw.githubusercontent.com/jatts1/instal/jatts"
else
	source="https://raw.githubusercontent.com/jatts1/instal/jatts"
fi

# go to root
cd


# check registered ip

clear

	echo "--------------- Selamat datang di Server - IP: $myip ---------------"
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
	echo "------------------------------------------------------------------------------"
echo "Apa yang ingin anda lakukan?"
	    echo ""
		echo -e "\e[032;1m 1\e[0m) Install Debian 7 32"
		echo -e "\e[032;1m 2\e[0m) Install OpenVPN"
		echo -e "\e[032;1m 3\e[0m) Install OCS Panel"
		echo -e "\e[032;1m 4\e[0m) Update Script Menu"
		echo -e "\e[032;1m 5\e[0m) Reboot"
		echo ""
	    echo -e "\e[032;1m x\e[0m) Exit"
	    echo ""
		read -p "Masukkan pilihan anda, kemudian tekan tombol ENTER: " option
    case $option in
        1)
		    clear
		    read -n1 -r -p "Anda akan menginstall Debian 7 32 bit Tekan sembarang tombol untuk melanjutkan ..."
			wget -O debian7.sh http://boedaxbayah-vpn.com/Debian7/debian7.sh && chmod +x debian7.sh && ./debian7.sh
		    read -n1 -r -p "Instalasi Selesai Tekan sembarang tombol untuk melanjutkan ..."
			./menu-install.sh
			exit

            ;;
        2)
            clear
		    read -n1 -r -p "Anda akan menginstall OpenVPN Tekan sembarang tombol untuk melanjutkan ..."
			wget -O openvpn.sh http://boedaxbayah-vpn.com/OpenVPN/openvpn.sh && chmod +x openvpn.sh && ./openvpn.sh
			read -n1 -r -p "Instalasi Selesai Tekan sembarang tombol untuk melanjutkan ..."
			./menu-install.sh
			exit
            ;;
        3)
            clear
		    read -n1 -r -p "Anda akan menginstall OCS Panel Tekan sembarang tombol untuk melanjutkan ..."
			apt-get install -y curl && wget -O ocs-panels.sh http://boedaxbayah-vpn.com/OCSPanels/ocs-panels.sh && chmod +x ocs-panels.sh && ./ocs-panels.sh
		    read -n1 -r -p "Instalasi Selesai Tekan sembarang tombol untuk melanjutkan ..."
			./menu-install.sh
			exit
            ;;
        4)
            clear
		    read -n1 -r -p "Anda akan melakukan Update Menu Tekan sembarang tombol untuk melanjutkan ..."
			wget -O update.sh http://boedaxbayah-vpn.com/Debian7/update.sh && chmod +x update.sh && ./update.sh
		    read -n1 -r -p "Instalasi Selesai Tekan sembarang tombol untuk melanjutkan ..."
			./menu-install.sh
			exit
            ;;
		 5)
            clear
			reboot
			exit
            ;;
		 x)
            clear
			rm menu-install.sh
			exit
            ;;
	   esac
   