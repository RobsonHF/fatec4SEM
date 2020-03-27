#!/bin/bash

#Exercício 9 - Listar o diretório corrente e exibir todos
#os arquivos com menos de 10 caracteres.

for file in *
do
        len=${#file};
        if (( $len < 10 ))
        then
        echo -e $file
        fi
done


