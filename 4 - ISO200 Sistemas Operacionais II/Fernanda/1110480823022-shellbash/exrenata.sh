#!/bin/bash

usuario=(`users`)
i=${#usuario[*]}


for ((aux=0; aux<i; aux++))
   do
      echo "Usuario: " ${usuario[aux]} " pertencente aos grupos: "
      grupos=(`groups ${usuario[aux]}`)
      j=${#grupos[*]}
         for ((aux2=3; aux2<j; aux2++))
            do
            echo ${grupos[aux2]}
            done
   done
