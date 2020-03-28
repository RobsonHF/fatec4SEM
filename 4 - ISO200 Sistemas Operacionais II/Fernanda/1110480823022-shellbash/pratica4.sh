#!/bin/bash

#Exercicio 4 - Fazer um script que utilize todas as variáveis internas do 
#shell concatenadas em texto.


variaveisInternas(){
arg1="casinha"
arg2=5

var1="$arg1 $arg2 Número de argumentos da linha de comando: $#"
var2="Opções correntemente em vigor: $-"
var3="Valor de saída do último comando executado: $?"
var4="Número de processos correntes: $$"
var5="Número de processo do último comando de segundo plano: $!"
var6="Nome de comando: $0"
var7="Parâmetros de posição 1: $1"
var8="Todos os argumentos na linha de comando: $*"
var9="$arg1 $arg2 Todos os argumentos na linha de comando como uma única String: $*"
var10="Todos os argumentos na linha de comando entre aspas individuais:""$@"

echo "$var1 $var2 $var3 $var4 $var5 $var6 $var7 $var8 $var9 $var10"

}

variaveisInternas

