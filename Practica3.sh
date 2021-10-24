#!/bin/bash 
# Autor : Edgar Francisco Mata Pérez
# Proposito : Script de practica 3
# Nombre del script : Practica 3

#HORA Y DIA
DIA=`date +"%d/%m/%Y"`
HORA=`date +"%H:%M"`

echo "Hoy es el $DIA y la hora actual es $HORA!"

# CREACIÓN DE MENÚ
echo " *** MENU ***"
Opcion1=" 1 . NET DISCOVER "
Opcion2=" 2 . ACTUAL USER "
Opcion3=" 3 . HOST NAME "
Opcion4=" 4 . EXIT "


#SELECT DE OPCIONES
select opcion in = "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" ;
do
    if [ "$opcion" = "$Opcion4"  ]; then
	    echo "Hasta la proxima :)"
	   exit 
	fi
    elif [ "$opcion" = "$Opcion3" ]; then
	echo $USER
	echo "Su usuario es:"$USER;
	echo $HOSTNAME
	echo "Su hostname es:"$HOSTNAME
	platform='unknown'
	unamestr=`uname`
	if [[ "$unamestr" == 'Linux' ]]; then
   		platform='linux'
	elif [[ "$unamestr" == 'win32' ]]; then
   		platform='freebsd'
	fi

    elif [ "$opcion" = "$Opcion2" ]; then
	  direccion_ip=$1
	  puertos="20,21,22,23,50,80,110,119,135,137,138,143,162,389,443,445,636,1025,1443,3389,5985,5986,8080,10000"
          [ $# -eq 0 ] && {echo "Modo de uso: $0 <direccion ip>"; exit 1; }
          IFS =,
	  for port in $puertos
	  do
		  timeout 1 bash -c "echo > /dev/tcp/$direccion_ip/$port > /dev/null 2>&1" &&\
		  echo $direccion_ip":"$port" is open"\
		  ||\
		  echo $direccion_ip":"$port" is closed"
	  done
     elif [ "$opcion" = "$Opcion1" ]; then
    	which ifconfig && { echo "Comando ifconfig existe...";
			    direccion_ip=`ifconfig |grep inet grep -v "127.0.0.1" |awk '{ print $2}'`;
			    echo " Esta es tu direccion ip: "$direccion_ip;
			    subred=`ifconfig |grep inet |grep -v "127.0.0.1" |awk '{ print $2}'|awk -F. '{print $1"."$2"."$3"."}'`;
			    echo " Esta es tu subred: "$subred;
		       	    }\
		        || { echo " No existe el comando ifconfig...usandoip";
			     direccion_ip=` ip addr show |grep inet | grep -v "127.0.0.1" |awk'{ print$2}'`;
			     echo " Esta es tu direccion ip: "$direccion_ip;
			     subred= `ip addr show |grep inet | grep -v "127.0.0.1" |awk '{ print$2}' |awk -F. '{print $1"."$2"."$3"."}'`;
			     echo " Esta es tu subred: "$subred;
		         }
	for ip in {1..254}
	do
	    ping -q -c 4 ${subred}${i} > /dev/null
	    if  [ $? -eq 0 ]	    
	    then
		 echo " Host responde: " ${subred}${id}
	    fi
		 
done
