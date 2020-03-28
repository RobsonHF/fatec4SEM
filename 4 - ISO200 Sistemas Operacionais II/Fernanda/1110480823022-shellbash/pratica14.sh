#!/bin/bash

#Exercicio 14 - Criar um script para compactar a pasta do usuário e 
# salvar em /backup/nomedousuario.gz.

compactarPasta(){


cd ..

tar -czvf 1110481823022-shellbash.tar.gz Fernanda/1110481823022-shellbash

mkdir backup

mv 1110481823022-shellbash.tar.gz backup

}

compactarPasta
