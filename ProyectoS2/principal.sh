#!/bin/bash
clear
largo=`tput cols`
pos=`expr $largo / 2`
tput cup 0 `expr $pos - 7 `
tput setaf 3
echo "INICIA SECION"
tput setaf 2
tput cup 1 1
echo "Ingresa nombre de usuario:"
tput cup 2 1
echo "Ingresa contrasena:"

tput cup 1 27
read usu
tput cup 2 20
read contr

if [ $usu = "PP" -a $contr = "PP" ]
then
	sh menu.sh
else 

echo "Usuario o contrase�a incorrectos"	
fi
