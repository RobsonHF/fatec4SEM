#!/bin/bash

#Exercício 11 - Exibir todos os usuários logados no formato:
#Usuário: xxxxxx
#Onde xxxxx é o login do usuário


exibeUsuariosLogados(){

for usuario in `users`
do
	echo "Usuário: $usuario"
done

}

exibeUsuariosLogados
