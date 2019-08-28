#!/bin/bash
clear
sh verificar.sh
largo=`tput cols`
pos=`expr $largo / 2`

tput cup 0 `expr $pos - 7 `
tput setaf 3
echo "ADMINISTRACION"
tput setaf 2
tput cup 1 1 
echo "1. Ingresar nuevo pago"
tput cup 2 1
echo "2. Estado de cuenta"
tput cup 3 1 
echo "3. Situacion del propietario"
tput sgr0
echo -n "\nElije:"
read op

case $op in

	1)
		echo "seleccionaste op1"

		;;
	2)
		echo "seleccionaste op2"
		sh advertencia.sh	

		;;

	3)
		echo "seleccionaste op3"
		
		;;

	*) echo "Incorrecto"
		
esac
sh advertencia.sh	

		

