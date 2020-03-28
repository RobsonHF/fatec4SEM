#!/bin/bash

#Exercício 12 - Listar os grupos dos usuários, no formato:
# Usuário xxxxx pertence aos grupos:
#		-yyyyy
#		-yyyyy

listarEmGrupo(){

for usuario in `users`
do
	echo "Usuário $usuario pertence aos grupos:"
	for grupo in `groups`
	do
		echo $grupo
	done
done

}

listarEmGrupo
