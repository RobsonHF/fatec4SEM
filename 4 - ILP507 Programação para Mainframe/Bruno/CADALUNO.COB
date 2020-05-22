      ************************************
      * Authors: Bruno Bega Harnik       *
      * Date: 2020-05                    *
      * Purpose: Academics               *
      * Tectonics: cobc                  *
      ************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. CADALUNO.
           AUTHOR. Bruno Bega Harnik.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO ASSIGN TO DISK
           ORGANIZATION    IS INDEXED
           ACCESS MODE     IS DYNAMIC
           RECORD KEY      IS RA
           ALTERNATE RECORD KEY IS NOME WITH DUPLICATES
           FILE STATUS     IS STATUS-ARQUIVO.

       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CADALUNO.DAT".
       
       01 REGALUNO.
           05 RA               PIC 9(06).
           05 NOME             PIC X(30).
           05 CPF              PIC 9(11).
           05 RG               PIC X(12).
           05 DATA-NASCIMENTO.
               10 DIA          PIC 9(02).
               10 MES          PIC 9(02).
               10 ANO          PIC 9(04).
           05 NATURALIDADE     PIC X(20).
           05 NACIONALIDADE    PIC X(20).
           05 ENDERECO.
               10 LOGRADOURO   PIC X(30).
               10 NUM-CASA     PIC 9(05).
               10 COMPLEMENTO  PIC X(12).
               10 BAIRRO       PIC X(20).
               10 CIDADE       PIC X(20).
               10 ESTADO       PIC X(02).
               10 CEP          PIC 9(08).
           05 EMAIL            PIC X(30).
           05 TELEFONE.
               10 DDD          PIC 9(03).
               10 NUM-TEL      PIC 9(09).
       
      *************************
      * VARIÁVEIS DE TRABALHO *
      *************************
       WORKING-STORAGE SECTION.
       
       77 STATUS-ARQUIVO       PIC X(02).
       77 MENSAGEM             PIC X(48) VALUE SPACES.
       77 TEMPORIZADOR         PIC 9(06) VALUE ZEROS.
       77 MENU-OPCAO           PIC X(01) VALUE SPACES.
       77 CODIGO-ESC           PIC 9(02) VALUE ZEROS.
       77 RA-BUSCA             PIC 9(06) VALUE ZEROS.

       01 CONTADORES.
           05 CONTADOR-ARQUIVO           PIC 9(4) VALUE ZEROS.
           05 ITENS-POR-PAGINA           PIC 9(2) VALUE 5.
           05 DIVISAO-CONTADOR           PIC 9(2).
           05 RESTO-CONTADOR             PIC 9(2) VALUE ZEROS.

       01 CHAVE-EOF                    PIC X(01) VALUE "N".                     
           88 CHAVE-EOF-SIM            VALUE "S".                              
           88 CHAVE-EOF-NAO            VALUE "N".  

      *********
      * TELAS *
      *********
       SCREEN SECTION.
       01 BLANK-SCREEN.
           05. BLANK SCREEN.

       01 TELA-MENSAGENS.
        05. VALUE "***************************************************"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 10 COLUMN 16.
        05. VALUE "*                                                 *"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 11 COLUMN 16.
        05. VALUE "*"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 16.
        05. PIC X(48) FROM MENSAGEM
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 17.
        05. VALUE "*"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 12 COLUMN 66.
        05. VALUE "*                                                 *"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 13 COLUMN 16.
        05. VALUE "***************************************************"
         BACKGROUND-COLOR 04 FOREGROUND-COLOR 14 LINE 14 COLUMN 16.

       01 TELA-MENU-PRINCIPAL.
        05. VALUE "Cadastro de alunos"
            FOREGROUND-COLOR 10 LINE 04 COLUMN 16.
        05. VALUE "Digite uma letra destacada:"
            FOREGROUND-COLOR 14 LINE 06 COLUMN 16.
        05. VALUE "C"
            FOREGROUND-COLOR 10 LINE 08 COLUMN 16.
        05. VALUE "adastrar um aluno"
            FOREGROUND-COLOR 15 LINE 08 COLUMN 17.
        05. VALUE "D"
            FOREGROUND-COLOR 13 LINE 10 COLUMN 16.
        05. VALUE "eletar aluno por RA"
            FOREGROUND-COLOR 15 LINE 10 COLUMN 17.
        05. VALUE "L"
            FOREGROUND-COLOR 14 LINE 12 COLUMN 16.
        05. VALUE "ista completa de alunos"
            FOREGROUND-COLOR 15 LINE 12 COLUMN 17.
        05. VALUE "F"
            FOREGROUND-COLOR 12 LINE 14 COLUMN 16.
        05. VALUE "inalizar o programa"
            FOREGROUND-COLOR 15 LINE 14 COLUMN 17.
        05. MENU-INPUT         PIC X(01) TO MENU-OPCAO
            FOREGROUND-COLOR 14 LINE 16 COLUMN 16 AUTO.
       
       01 TELA-QUER-SAIR.
        05. VALUE "Deseja realmente sair?"
            FOREGROUND-COLOR 14 LINE 06 COLUMN 16.
        05. VALUE "Enter ou Tab - "
            FOREGROUND-COLOR 08 LINE 08 COLUMN 16.
        05. VALUE "Cancelar"
            FOREGROUND-COLOR 14 LINE 08 COLUMN 31.
        05. VALUE "ESC - "
            FOREGROUND-COLOR 12 LINE 09 COLUMN 16.
        05. VALUE "Sair"
            FOREGROUND-COLOR 15 LINE 09 COLUMN 22.
        05. SAIDA-INPUT         PIC X(02) TO CODIGO-ESC
            FOREGROUND-COLOR 14 LINE 15 COLUMN 16 AUTO.

       01 TELA-CADASTRO.
        05. VALUE "Cadastrar aluno"
            FOREGROUND-COLOR 10 LINE 01 COLUMN 01.
        05. VALUE "              Nome"
            FOREGROUND-COLOR 15 LINE 03 COLUMN 06.
        05. INPUT-NOME         PIC X(30) TO NOME
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 03 COLUMN 26.
        05. VALUE "               CPF"
            FOREGROUND-COLOR 15 LINE 05 COLUMN 06.
        05. INPUT-CPF          PIC 9(11) TO CPF
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 05 COLUMN 26.
        05. VALUE "                RG"
            FOREGROUND-COLOR 15 LINE 07 COLUMN 06.
        05. INPUT-RG           PIC X(12) TO RG
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 07 COLUMN 26.
        05. VALUE "Data de nascimento"
            FOREGROUND-COLOR 15 LINE 09 COLUMN 06.
        05. VALUE "Dia"
            FOREGROUND-COLOR 03 LINE 08 COLUMN 26.
        05. INPUT-NASC-DIA     PIC 9(02) TO DIA
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 09 COLUMN 26.
        05. VALUE "Mes"
            FOREGROUND-COLOR 03 LINE 08 COLUMN 30.
        05. INPUT-NASC-MES     PIC 9(02) TO MES
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 09 COLUMN 30.
        05. VALUE "Ano"
            FOREGROUND-COLOR 03 LINE 08 COLUMN 34.
        05. INPUT-NASC-ANO     PIC 9(04) TO ANO
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 09 COLUMN 34.
        05. VALUE "      Naturalidade"
            FOREGROUND-COLOR 15 LINE 11 COLUMN 06.
        05. INPUT-NATURALIDADE PIC X(20) TO NATURALIDADE
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 11 COLUMN 26.
        05. VALUE "     Nacionalidade"
            FOREGROUND-COLOR 15 LINE 13 COLUMN 06.
        05. INPUT-NACIONALIDADE PIC X(20) TO NACIONALIDADE
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 13 COLUMN 26.
        05. VALUE "          Endereco"
            FOREGROUND-COLOR 15 LINE 15 COLUMN 06.
        05. VALUE "Logradouro"
            FOREGROUND-COLOR 03 LINE 14 COLUMN 26.
        05. INPUT-LOGRADOURO PIC X(30) TO LOGRADOURO
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 15 COLUMN 26.
        05. VALUE "Num."
            FOREGROUND-COLOR 03 LINE 14 COLUMN 57.
        05. INPUT-NUM-CASA PIC 9(05) TO NUM-CASA
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 15 COLUMN 57.
        05. VALUE "Complemento"
            FOREGROUND-COLOR 03 LINE 14 COLUMN 63.
        05. INPUT-COMPLEMENTO PIC X(12) TO COMPLEMENTO
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 15 COLUMN 63.
        05. VALUE "Bairro"
            FOREGROUND-COLOR 03 LINE 16 COLUMN 26.
        05. INPUT-BAIRRO PIC X(20) TO BAIRRO
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 17 COLUMN 26.
        05. VALUE "Cidade"
            FOREGROUND-COLOR 03 LINE 16 COLUMN 47.
        05. INPUT-CIDADE PIC X(20) TO CIDADE
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 17 COLUMN 47.
        05. VALUE "Estado"
            FOREGROUND-COLOR 03 LINE 16 COLUMN 68.
        05. INPUT-ESTADO PIC X(2) TO ESTADO
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 17 COLUMN 68.
        05. VALUE "CEP"
            FOREGROUND-COLOR 03 LINE 18 COLUMN 26.
        05. INPUT-CEP PIC X(09) TO CEP
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 19 COLUMN 26.
        05. VALUE "             Email"
            FOREGROUND-COLOR 15 LINE 21 COLUMN 06.
        05. INPUT-EMAIL PIC X(30) TO EMAIL
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 21 COLUMN 26.
        05. VALUE "          Telefone"
            FOREGROUND-COLOR 15 LINE 23 COLUMN 03.
        05. VALUE "DDD"
            FOREGROUND-COLOR 03 LINE 22 COLUMN 26.
        05. INPUT-DDD PIC 9(03) TO DDD
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 23 COLUMN 26.
        05. VALUE "Numero"
            FOREGROUND-COLOR 03 LINE 22 COLUMN 30.
        05. INPUT-NUM-TELEFONE PIC 9(09) TO TELEFONE
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 23 COLUMN 30.

       01 TELA-DELETAR.
        05. VALUE "Deletar registro por RA"
            FOREGROUND-COLOR 12 LINE 01 COLUMN 01.
        05. VALUE "                RA"
            FOREGROUND-COLOR 15 LINE 03 COLUMN 06.
        05. INPUT-RA         PIC 9(06) TO RA-BUSCA
         BACKGROUND-COLOR 07 FOREGROUND-COLOR 01 LINE 03 COLUMN 26.

      **************
      * O PROGRAMA *
      **************
       PROCEDURE DIVISION.
       INICIO.

      ***************************************
      * Rotinas de abertura e reutilizáveis *
      ***************************************
       000-ABERTURA.
           OPEN I-O ARQUIVO
           IF STATUS-ARQUIVO NOT = "00"
               IF STATUS-ARQUIVO = "30"
               OPEN OUTPUT ARQUIVO
               MOVE "     Arquivo sendo criado...     " TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               CLOSE ARQUIVO
               GO TO 000-ABERTURA
               ELSE
               MOVE "    Erro na abertura do arquivo  " TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO FIM-SAIDA.

       001-ZERA-VARS.
           MOVE ZEROS TO CPF DIA MES ANO NUM-CASA CEP DDD NUM-TEL
           MOVE SPACES TO NOME RG NATURALIDADE NACIONALIDADE LOGRADOURO
               COMPLEMENTO BAIRRO CIDADE ESTADO EMAIL.

       002-MENU-PRINCIPAL.
           DISPLAY BLANK-SCREEN
           DISPLAY TELA-MENU-PRINCIPAL
           ACCEPT TELA-MENU-PRINCIPAL
           
           IF MENU-OPCAO = "C" OR "c"
               PERFORM LER-COMPUTAR UNTIL CHAVE-EOF-SIM
                   MOVE "N" TO CHAVE-EOF
                   MOVE ZEROS TO CONTADOR-ARQUIVO
               PERFORM CAD-TELA THRU CAD-FIM
               GO TO 002-MENU-PRINCIPAL
           
           ELSE IF MENU-OPCAO = "D" OR "d"
               DISPLAY BLANK-SCREEN
               DISPLAY TELA-DELETAR
               ACCEPT TELA-DELETAR
               MOVE ZEROS TO RA
               START ARQUIVO KEY IS GREATER THAN RA
               PERFORM BUSCA-E-DELETA UNTIL CHAVE-EOF-SIM
               PERFORM BUSCA-LIMPA
               GO TO 002-MENU-PRINCIPAL

           ELSE IF MENU-OPCAO = "L" OR "l"
               DISPLAY BLANK-SCREEN
               MOVE ZEROS TO RA
               START ARQUIVO KEY IS GREATER THAN RA
               PERFORM LER-E-EXIBIR UNTIL CHAVE-EOF-SIM
               DISPLAY "Tecle ENTER para prosseguir..."
               ACCEPT CODIGO-ESC
               PERFORM LER-MOSTRA-TOTAL THRU LER-LIMPA
               GO TO 002-MENU-PRINCIPAL
           
           ELSE IF MENU-OPCAO = "F" OR "f"
               GO TO FIM-QUER-SAIR

           ELSE
               MOVE " Escolha incorreta..." TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO 002-MENU-PRINCIPAL.
       
       DEL-REGISTRO.
           DELETE ARQUIVO RECORD
           EXIT.

      ***********************
      * Rotinas de cadastro *
      ***********************

       CAD-TELA.
           DISPLAY BLANK-SCREEN
           PERFORM 001-ZERA-VARS
           DISPLAY TELA-CADASTRO
           ACCEPT TELA-CADASTRO
           IF NOME = SPACES
               MOVE " Pelo menos o nome precisa ser preenchido"
                   TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
               GO TO CAD-TELA.
           ADD 1 TO RA
           WRITE REGALUNO.
       
       CAD-FIM.
           MOVE " Aluno cadastrado com sucesso!" TO MENSAGEM
               PERFORM MSG-ZERA THRU MSG-FIM
           EXIT.

      **********************
      * Rotinas de leitura *
      **********************
       LER-COMPUTAR.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO CHAVE-EOF.
           IF CHAVE-EOF NOT = "S"
           ADD 1 TO CONTADOR-ARQUIVO.

       LER-E-EXIBIR.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO CHAVE-EOF.
           IF CHAVE-EOF = "N"
           DISPLAY REGALUNO
           ADD 1 TO CONTADOR-ARQUIVO
           DIVIDE CONTADOR-ARQUIVO BY ITENS-POR-PAGINA
           GIVING DIVISAO-CONTADOR REMAINDER RESTO-CONTADOR
           IF CONTADOR-ARQUIVO > 4
           IF RESTO-CONTADOR = 0
               DISPLAY "Pressione ENTER para exibir a pagina seguinte."
               ACCEPT CODIGO-ESC.

       LER-MOSTRA-TOTAL.
           STRING CONTADOR-ARQUIVO DELIMITED BY SIZE
                  " registros no arquivo." DELIMITED BY SIZE
                  INTO MENSAGEM.
                  PERFORM MSG-ZERA THRU MSG-FIM.

       LER-LIMPA.
           MOVE ZEROS TO CONTADOR-ARQUIVO
           MOVE "N" TO CHAVE-EOF
           EXIT.


      ********************
      * Rotinas de busca *
      ********************
       BUSCA-E-DELETA.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO CHAVE-EOF.
           IF CHAVE-EOF = "N"
           ADD 1 TO CONTADOR-ARQUIVO.
           IF RA = RA-BUSCA
               DISPLAY "Registro encontrado:"
               DISPLAY REGALUNO
               MOVE "S" TO CHAVE-EOF
               EXIT.
       
       BUSCA-LIMPA.
           IF RA = RA-BUSCA
               DISPLAY "Deletando. Tecle ENTER para prosseguir."
               PERFORM DEL-REGISTRO
               ELSE
                   DISPLAY "Nenhum registro encontrado."
                   DISPLAY "Tecle ENTER para prosseguir...".
           ACCEPT CODIGO-ESC
           MOVE ZEROS TO CONTADOR-ARQUIVO
           MOVE "N" TO CHAVE-EOF
           EXIT.

      ***********************
      * Rotinas de mensagem *
      ***********************
       MSG-ZERA.
           MOVE ZEROS TO TEMPORIZADOR.
       MSG-DISPLAY.
           DISPLAY BLANK-SCREEN.
           DISPLAY TELA-MENSAGENS.
       MSG-TEMPO.
           ADD 1 TO TEMPORIZADOR
           IF TEMPORIZADOR < 2000
               GO TO MSG-TEMPO
           ELSE
               DISPLAY BLANK-SCREEN.
       MSG-FIM.
           MOVE SPACES TO MENSAGEM
           EXIT.

      **************************
      * Rotinas de finalização *
      **************************
       FIM-QUER-SAIR.
           DISPLAY BLANK-SCREEN
           DISPLAY TELA-QUER-SAIR
           ACCEPT TELA-QUER-SAIR
           ACCEPT CODIGO-ESC FROM ESCAPE KEY
           
           IF CODIGO-ESC = 01
               GO TO FIM-SAIDA
           ELSE
               GO TO 002-MENU-PRINCIPAL.

       FIM-SAIDA.
           DISPLAY BLANK-SCREEN
           CLOSE ARQUIVO.
           
       FIM-EXIT.
           EXIT PROGRAM.
       FIM-STOP-RUN.
           STOP RUN.