#!/bin/bash
#
# WebPhoenix: Open Source
# License: General Public License
# System: GNU/linux
# Date: 05-05-2022
#
# ==============================================
#                   Variables
# ==============================================
operatingSystem=$(uname -o)
deviceArchitecture=$(uname -m)
showPath=$(pwd)
# ==============================================
#                  Light colors
# ==============================================
black="\e[1;30m"
blue="\e[1;34m"
green="\e[1;32m"
cyan="\e[1;36m"
red="\e[1;31m"
purple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"
# ==============================================
#                  Dark colors
# ==============================================
blackDark="\e[0;30m"
blueDark="\e[0;34m"
greenDark="\e[0;32m"
cyanDark="\e[0;36m"
redDark="\e[0;31m"
purpleDark="\e[0;35m"
yellowDark="\e[0;33m"
whiteDark="\e[0;37m"
# ==============================================
#               Background colors
# ==============================================
blackBack=$(setterm -background black)
blueBack=$(setterm -background blue)
greenBack=$(setterm -background green)
cyanBack=$(setterm -background cyan)
redBack=$(setterm -background red)
yellowBack=$(setterm -background yellow)
whiteBack=$(setterm -background white)
# ==============================================
#             Installing dependencies
# ==============================================
function dependencies() {
    whois=$(command -v whois)
    if [[ "${whois}" == "" ]]; then
	apt install whois -y
    fi
    whatweb=$(command -v whatweb)
    if [[ "${whatweb}" == "" ]]; then
	apt install whatweb -y
    fi
}
# ==============================================
#               Banner WebPhoenix
# ==============================================
function webphoenix() {
    sleep 0.5
    clear
    echo -e ${green}"
__        __   _     ${red}____  _                      _${green}
\ \      / /__| |__ ${red}|  _ \| |__   ___   ___ _ __ (_)_  __${green}
 \ \ /\ / / _ \ '_ '${red}| |_) | '_ \ / _ \ / _ \ '_ \| \ \/ /${green}
  \ V  V /  __/ |_) ${red}|  __/| | | | (_) |  __/ | | | |>  <${green}
   \_/\_/ \___|_.__/${red}|_|   |_| |_|\___/ \___|_| |_|_/_/\_${white}v.1.1

          ${yellow}.:.:. ${white}Web Tool coded by: @Luishiño ${yellow}.:.:.${white}

${redBack}:: Disclaimer: Developers assume no liability and are not    ::${blackBack}
${redBack}:: responsible for any misuse or damage caused by WebPhoenix ::${blackBack}"${white}
}
# ==============================================
#             Invalid option message
# ==============================================
function invalid() {
    echo -e ${yellow}"
[${red}!${yellow}] ${red}Invalid option!"${white}
    sleep 0.5
}
# ==============================================
#                   Option menu
# ==============================================
function menu() {
    webphoenix
    echo -e -n ${red}"
[${green}01${red}] ${yellow}Whois${red}
[${green}02${red}] ${yellow}WhatWeb${red}
[${green}03${red}] ${yellow}Boards${red}
[${green}00${red}] ${yellow}Exit${red}

[${green}*${red}] ${green}Choose an option: "${white}
    read -r option

    if [[ "${option}" == "0" || "${option}" == "00" ]]; then
	exit
    elif [[ "${option}" == "1" || "${option}" == "01" ]]; then
	webphoenix
	echo -e -n ${red}"
[${green}*${red}] ${green}Enter a domain or an IP: "${white}
	read -r host
	webphoenix
	echo -e ""
	whois ${host}
    elif [[ "${option}" == "2" || "${option}" == "02" ]]; then
	webphoenix
	echo -e -n ${red}"
[${green}*${red}] ${green}Enter a domain or an IP: "${white}
	read -r host
	webphoenix
	echo -e ""
	whatweb ${host}
    elif [[ "${option}" == "3" || "${option}" == "03" ]]; then
	webphoenix
	echo -e -n ${red}"
[${green}*${red}] ${green}Enter a domain or an IP: "${white}
	read -r host
	webphoenix
	echo -e ""
	whois ${host}
	whatweb ${host}
    fi
}
# ==============================================
#              Declaring functions
# ==============================================
dependencies
menu
# ==============================================
#          Created by: @Luishiño © 2022
# ==============================================
