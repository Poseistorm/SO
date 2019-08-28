#!/bin/bash
clear
menu=true
while $menu
do	
	large=`tput cols`
	large2=`expr $large / 2`
	tput cup 0 `expr $large2 - 7`
	echo "MENU ADMIN"
	echo "1.Ingresar usuario"
	echo "2.Crear usuario"
	echo "3.Cambiar contrasenia"
	echo "4.Salir"
	echo -n "Opcion;"
	read op
	case $op in
		1)
			reintentar=true
	
			while $reintentar	
			do
				clear
				tput cup 0 0	
				echo "Usuario:"
				echo "Contrasenia:"
				tput cup 0 8
				read usr
				tput cup 1 12
				read pass
				if [ [ $usr != "" || $pass != "" ] && `cat datosAdmin | cut -d: -f 2 | grep -c $pass` -eq 1 ] && [ `cat datosAdmin | cut -d: -f 1 | grep -c $usr` -eq 1 ]
				then
					reintentar=false
					sh menu.sh
				else
			
					echo "Usuario o contrasenia incorrectos: desea reintentar (s/n):"
					tput cup 2 59
					read cont
					if [ $cont = "n" ]
					then
						reintentar=false
						clear
					fi
				fi
			done
			;;
		2)
			
			reintentar=true	              
			clear
			large=`tput cols`
			large2=`expr $large / 2`
			tput cup 0 `expr $large2 - 5`
			
			echo "REGISTRANDO"
			echo "Ingrese usuario:"
			echo "Ingrese contrasenia:"
			echo "Repite contrasenia:"

			tput cup 1 16
			read usr
		
			while $reintentar
			do	
				if [ $usr != "" ] 
				then	
					tput cup 2 20 
					read pass0
					tput cup 3 19 
					read pass1
					if [ $pass0 != "" ]
					then
						if [ `cat datosAdmin | cut -d: -f 1 | grep -c $usr` -ne 1 ]
						then	
							if [ $pass0 = $pass1 ]
							then
								echo "$usr:$pass1" >> datosAdmin
								echo "Ha sido registrado"
								reintentar=false
							else
								tput clear
								echo "Las contrasenias no coincixden"				
							fi
						else 
							tput clear
							echo "Ingrese un usuario"
						fi
					else
						tput clear
						echo "Ingresa una contraseña"
					fi
			
				else 
					tput clear
					echo "El usuario ya está registrado"
				fi
			done
				
				
			
			;;
		3)
			echo "3"
			;;
		4) 	
			menu = false
			;;
	esac

done
