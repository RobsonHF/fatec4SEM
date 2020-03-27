#!/bin/bash

verificaRA(){

echo "Digite seu RA, malandragem:"
read RA;
resto=$(($RA%2))

if [ $resto -eq 0 ]
then
        echo "seu RA é par..."
else
        echo "seu RA é ímpar..."
fi
}

verificaRA

