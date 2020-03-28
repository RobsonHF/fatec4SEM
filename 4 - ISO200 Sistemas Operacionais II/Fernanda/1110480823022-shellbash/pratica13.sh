#!/bin/bash

#Exercício 13 - Para cada usuário criar a seguinte arvore de diretórios na posta home (do usuário).
#~/Faculdade/SistemasOperacionais
#~/Faculdade/LinguagemdeProgramacao
#~/Faculdade/InteligenciaArtificial
#~/Diversao/Livros
#~/Diversao/Trabalhos
#~/Diversao/TestesProgramacao


criarDiretorios(){

mkdir Faculdade Faculdade/SistemasOperacionais Faculdade/LinguagemDeProgramacao Faculdade/InteligenciaArtificial
mkdir Diversao Diversao/Livros Diversao/Trabalhos Diversao/TestesProgramacao
echo "Diretórios e arquivos: "
ls
cd Faculdade 
echo "Diretório Faculdade:"
ls
cd ..
cd Diversao
echo "Diretório Diversão:"
ls
cd ..


}

criarDiretorios
