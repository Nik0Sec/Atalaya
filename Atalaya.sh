#!/bin/bash                                                                                                                                                                                                                           
                                                                                                                                                                                                                                           
#Autor : NIk0                                                                                                                                                                                                                              
                                                                                                                                                                                                                                           
#Simple navaja suiza                                                                                                                                                                                                                       


#Colores

Negro='\033[1;30m'        # Negro
Rojo='\033[1;31m'         # Rojo
Verde='\033[1;32m'        # Verde
Amariilo='\033[1;33m'     # Amarillo
Azul='\033[1;34m'         # Azul
Morado='\033[1;35m'       # Morado
Cyan='\033[1;36m'         # Cyan
Blanco='\033[1;37m'       # Blanco
Nada="\033[0m\e[0m"       # Término de color
clear

echo "-----------------------------------------------"
echo -e "${Verde}Atalaya: Simple Navaja Suiza${Nada}"
echo -e "${Amarillo}Creado por https://criminalminds.github.io/${Nada}"
echo "-----------------------------------------------" 
#Chequeando si el usuario es r00t


if [ $(id -u) -ne "0" ]; then

        echo -e "${Azul}Es necesario ser ${Rojo}root${Nada} ${Azul}para poder ejecutar este script${Nada}"
        echo -e "${Azul}sudo ./Atalaya.sh${Nada}"

        exit
fi

# Menú para elegir opciones

echo "Escoge el método que quieras"
echo -e "${Rojo}[1]${Nada} Conectarse a servidor con conexión encriptada"
echo -e "${Rojo}[2]${Nada} OSINT (Chile)"
echo -e "${Rojo}[3]${Nada} Reconocimiento web"
echo -e "${Rojo}[4]${Nada} Borrar historial de Bash"
echo "-----------------------------------------------"
read tipo

sleep 0.5
# Chequeando si están las herramientas requeridas

echo -e "${Morado}Revisando si están las herramientas necesarias para usar este script...${Nada}"

sleep 1

checknmap=$(which nmap) || $(ps aux | grep "nmap" | head -n1) 2>/dev/null
checkNcat=$(which ncat) || $(ps aux | grep "ncat" | head -n1) 2>/dev/null 
checkCurl=$(which curl) || $(ps aux | grep "curl" | head -n1) 2>/dev/null

if [ "$?" -eq "0" ]; then
        echo -e "${Morado}Todo OK...${Nada}"
else
        echo "Herramientas necesarias no encontradas, intenta con: "
        echo "sudo apt-get install nmap"
	echo "sudo apt-get install curl"
        echo "sudo apt-get install ncat"
        exit
fi

if [ $tipo -eq "1" ]; then
        echo "Si hay alguna duda, seguir el tutorial en mi página web https://criminalminds.github.io/posts/Bypass-IDS/" 
        read -p "Ingresa la ip a la cuál te quieres conectar: " ip
        read -p "Ingresa el puerto: " puerto

ncat -nv $ip $puerto --ssl



elif [ $tipo -eq "2" ]; then

sleep 1
	echo "PARA PONER OTRO NOMBRE SE DEBE EDITAR EL CÓDIGO FUENTE! En mantenimiento esta opción :/"
        echo "-----------------------------------------------"
curl -s -X POST -d 'term=sebastian juan miguel piñera echeñique' --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0" https://www.nombrerutyfirma.com/buscar | awk ' /<td>/ { gsub(/<\/?td>/, ""); gsub(/\t\t+/, ""); print }'
        echo "-----------------------------------------------"

elif [ $tipo -eq "3" ]; then

        read -p  "Ingresa la ip: " IP
        echo "-----------------------------------------------"
        echo "Escaneando con Nmap..."
        echo "-----------------------------------------------"
sleep 1
sudo nmap -sS -sV -T4 $IP

elif [ $tipo -eq "4" ]; then

sleep 1
        echo -e "${Rojo}SI/NO${Nada}"
        read -p "Quieres borrar tu historial de .bash_history?: " borrar

        if [ $borrar == "SI" ]; then
        echo "Borrando tu historial..."
echo "Nada por aquí ;)" > .bash_history
history -c
        elif [ $borrar == "NO" ]; then
        echo "Saliendo del programa..."
        exit $?
        fi
fi 
