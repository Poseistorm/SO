#!/bin/bash
clear
echo "MENU ADMIN"
echo "=========="
echo "1.Ingresar usuario"
echo "2.Crear usuario"
echo "3.Cambiar contrasenia"
echo "4.Salir"
read op
case $op in
	1)
		reintentar=true
		while $reintentar
		do
			echo "Usuario:"
			read usr
			echo "Contrasenia"
			read pass
			if [ `cat datosAdmin | cut -d: -f 2 | grep -c $pass` -eq 1 ] && [ `cat datosAdmin | cut -d: -f 1 | grep -c $usr` -eq 1 ]
			then
				reintentar=false
				sh menu.sh
			else
				echo "Usuario o contrasenia incorrectos"
			fi
		done
		;;
	2)
		reintentar=true	              
		echo "Ingrese usuario"
		read usr
		while $reintentar
		do			
			echo "Ingrese contrasenia"
			read pass0
			echo "Repite contrasenia"
			read pass1
			if [ $pass0 = $pass1 ]
			then
				echo "$usr:$pass1" >> datosAdmin
				echo "Ha sido registrado"
				reintentar=false
			else
				clear
				echo "Las contrasenias no coincixden"				
			fi
		done
		;;
	3)
		echo "3"
		;;
esac
