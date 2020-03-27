#!/bin/bash


#Exercicio 6 - Fazer um script que utiliza os seguintes operadores: + - ** / *

funcCalculadora(){

RA=1110481823022

echo "Meu RA é $RA."

echo "O que deseja fazer?"
echo "1 - Somar"
echo "2 - Subtrair"
echo "3 - Multiplicar"
echo "4 - Dividir"
read opc;

         if [ $opc -eq 1 ]
	then
                echo "Digite o número que deseja somar ao RA."
                read resp;
                result=$((RA+resp))
        elif [ $opc -eq 2 ]
        then
                echo "Digite o número que deseja subtrair do RA."
                read resp;
                result=$(($RA-$resp))
        elif [ $opc -eq 3 ]
        then
                echo "Digite o número que deseja multiplicar pelo RA."
                read resp;
                result=$(($RA*$resp))
        elif [ $opc -eq 4 ]
         then
                echo "Digite o número pelo qual deseja dividir seu RA."
                read resp;
	else
                echo "inválido"
        fi

        echo "o resultado é $result"
}

funcCalculadora

