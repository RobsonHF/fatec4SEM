      ****************************
      * Authors: Bruno Harnik    *
      * Date: 2020-05            *
      * Purpose: Viagem no tempo *
      * Tectonics: cobc          *
      ****************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. BOLINHO.
           AUTHOR. Bruno Harnik.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO ASSIGN TO DISK
           ORGANIZATION            IS INDEXED
           ACCESS MODE             IS DYNAMIC
           RECORD KEY              IS SKU
           ALTERNATE RECORD KEY    IS NOME WITH DUPLICATES
           FILE STATUS             IS WS-STATUS-ARQUIVO.
        
       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "BOLINHO.DAT".
           01 PRODUTO.
               05 SKU              PIC 9(04).
               05 NOME             PIC X(30).
               05 VALIDADE.
                   10 DIA          PIC 99.
                   10 MES          PIC 99.
                   10 ANO          PIC 9(04).
               05 VALOR-CUSTO      PIC 9(04)V99.
               05 VALOR-VENDA      PIC 9(04)V99.
               05 QTD-ESTOQUE      PIC 9(04).

       WORKING-STORAGE SECTION.
           77 WS-STATUS-ARQUIVO            PIC X(02).
           77 WS-MENSAGEM                  PIC X(48) VALUE SPACES.
           77 WS-TEMPORIZADOR              PIC 9(06) VALUE ZEROS.
           77 WS-MENU-OPCAO                PIC X(01) VALUE SPACES.
           77 WS-CODIGO-ESC                PIC X(02) VALUE ZEROS.
           77 WS-CONTADOR-ARQUIVO          PIC 9(04) VALUE ZEROS.

           77 WS-CHAVE-VALIDA-FORM         PIC X     VALUE "N".                

           77 WS-DIVISAO-CONTADOR          PIC 9(04) VALUE ZEROS.
           77 WS-RESTO-CONTADOR            PIC 9(04) VALUE ZEROS.

           77 WS-ANO-RESTO                 PIC 9.
           77 WS-ANO-DIVISAO               PIC 9(04).

           77 WS-BUSCA-SKU                 PIC 9(04).

           77 WS-CHAVE-EOF                 PIC X     VALUE "N".                     
              88 WS-CHAVE-EOF-SIM                    VALUE "S".                              
              88 WS-CHAVE-EOF-NAO                    VALUE "N".

           77 WS-BUSCA-DIA                 PIC 99    VALUE ZEROS.
           77 WS-BUSCA-MES                 PIC 99    VALUE ZEROS.
           77 WS-BUSCA-ANO                 PIC 9999  VALUE ZEROS.
           
           77 WS-VALOR-TOTAL-CUSTO         PIC 9(07)V99 VALUE ZEROS.
           77 WS-VALOR-TOTAL-VENDA         PIC 9(07)V99 VALUE ZEROS.
           77 WS-TOTAL-QTD                 PIC 9(07)    VALUE ZEROS.
           77 WS-VALOR-AUX                 PIC 9(07)V99 VALUE ZEROS.
           77 WS-VALOR-AUX-PRINT           PIC Z(07),99 VALUE ZEROS.
           
       01 WS-PRODUTO.
           05 WS-SKU                   PIC X(05).
           05 WS-NOME                  PIC X(31).
           05 WS-VALIDADE              PIC X(11).
           05 WS-VALOR-CUSTO           PIC ZZZZ9,99.
           05 WS-VALOR-VENDA           PIC ZZZZ9,99.
           05 WS-QTD-ESTOQUE           PIC Z(04)Z.
           

      *>    01 WS-TABELA-PRODUTOS REDEFINES WS-PRODUTO.
      *>        05 WS-LINHA-PRODUTOS OCCURS 1 TIMES.
      *>            10 WS-TABELA-SKU                 PIC X(05).
      *>            10 WS-TABELA-NOME                PIC X(31).
      *>            10 WS-TABELA-VALIDADE            PIC X(11).
      *>            10 WS-TABELA-VALOR-CUSTO         PIC X(08).
      *>            10 WS-TABELA-VALOR-VENDA         PIC X(08).
      *>            10 WS-TABELA-QTD-ESTOQUE         PIC Z(05).

       SCREEN SECTION.
       01 SS-TELA-MENU.
         05 BLANK SCREEN BACKGROUND-COLOR 03 FOREGROUND-COLOR 00.
         05 VALUE "*------------------------*" LINE 02 COLUMN 27.
         05 VALUE "|  .~~~O~~~.             |" LINE 03 COLUMN 27.
         05 VALUE "| (         ) Bomboniere |" LINE 04 COLUMN 27.
         05 VALUE "|  \ ~~~~~ /  Bolinho    |" LINE 05 COLUMN 27.
         05 VALUE "|   \_____/              |" LINE 06 COLUMN 27.
         05 VALUE "*------------------------*" LINE 07 COLUMN 27.
         05 VALUE "Escolha com a letra destacada:"
                                                LINE 10 COLUMN 20.
         05 VALUE "C"                          
                            FOREGROUND-COLOR 15 LINE 12 COLUMN 20.
         05 VALUE "adastrar novo produto"      LINE 12 COLUMN 21.
         05 VALUE "R"                          
                            FOREGROUND-COLOR 15 LINE 13 COLUMN 20.
         05 VALUE "emover registro de produto" LINE 13 COLUMN 21.
         05 VALUE "E"                          
                            FOREGROUND-COLOR 15 LINE 14 COLUMN 20.
         05 VALUE "ditar produto"              LINE 14 COLUMN 21.
         05 VALUE "A"                          
                            FOREGROUND-COLOR 15 LINE 15 COLUMN 20.
         05 VALUE "valiar validades"   LINE 15 COLUMN 21.
         05 VALUE "M"                          
                            FOREGROUND-COLOR 15 LINE 16 COLUMN 20.
         05 VALUE "ostrar lista completa"      LINE 16 COLUMN 21.
         05 VALUE "S"                          
                            FOREGROUND-COLOR 15 LINE 17 COLUMN 20.
         05 VALUE "air"                        LINE 17 COLUMN 21.
         05 INPUT-MENU    PIC X(01) TO WS-CODIGO-ESC AUTO
                                                LINE 20 COLUMN 60.
       01 SS-TELA-FIM.
         05 BLANK SCREEN BACKGROUND-COLOR 07 FOREGROUND-COLOR 15.
         05 VALUE "Deseja realmente sair?"     LINE 10 COLUMN 20.
         05 VALUE "Enter ou Tab - "
                            FOREGROUND-COLOR 14 LINE 12 COLUMN 20.
         05 VALUE "Cancelar"                   LINE 12 COLUMN 35.
         05 VALUE "ESC - "
                            FOREGROUND-COLOR 14 LINE 14 COLUMN 20.
         05 VALUE "Sair"                       LINE 14 COLUMN 26.
         05 INPUT-FIM         PIC X(02) TO WS-CODIGO-ESC
                            FOREGROUND-COLOR 14 LINE 16 COLUMN 60 AUTO.
       
       01 SS-TELA-MENSAGEM.
           05 BLANK SCREEN BACKGROUND-COLOR 04 FOREGROUND-COLOR 15.
           05 PIC X(48) FROM WS-MENSAGEM LINE 12 COLUMN 16.

       01 SS-TELA-CADASTRO.
           05 BLANK SCREEN BACKGROUND-COLOR 02 FOREGROUND-COLOR 15.
           05 VALUE "Cadastro de produtos"
                             FOREGROUND-COLOR 10 LINE 05 COLUMN 30.
           05 VALUE "      Nome do produto:"     LINE 09 COLUMN 20.
           05 PIC X(30) FROM NOME TO NOME  LINE 09 COLUMN 43.
           05 VALUE "     Data de validade:"     LINE 11 COLUMN 20.
           05 PIC 9(02) FROM DIA TO DIA     
                                                 LINE 11 COLUMN 43.
           05 VALUE "/"                          LINE 11 COLUMN 45.
           05 PIC 9(02) FROM MES TO MES     
                                                 LINE 11 COLUMN 46.
           05 VALUE "/"                          LINE 11 COLUMN 48.
           05 PIC 9(04) FROM ANO TO ANO
                                                 LINE 11 COLUMN 49.
           05 VALUE "DD MM AAAA" 
                             FOREGROUND-COLOR 07 LINE 12 COLUMN 43.
           05 VALUE "    Valor de custo: R$"     LINE 15 COLUMN 20.
           05 PIC 9(04)V99
                                   FROM VALOR-CUSTO TO VALOR-CUSTO   
                                                 LINE 15 COLUMN 43.
           05 VALUE "    Valor de venda: R$"     LINE 17 COLUMN 20.
           05 PIC 9(04)V99
                                   FROM VALOR-VENDA TO VALOR-VENDA 
                                                 LINE 17 COLUMN 43.
           05 VALUE "Quantidade em estoque:"     LINE 20 COLUMN 20.
           05 PIC 9(04) FROM QTD-ESTOQUE TO QTD-ESTOQUE
                                                 LINE 20 COLUMN 43.
       
       01 SS-TELA-MOSTRA-LISTA.
         05 BLANK SCREEN BACKGROUND-COLOR 00 FOREGROUND-COLOR 07.
         05 "SKU  Nome do produto                 Validade     Custo   V
            "enda Qtd.            " LINE 1 COLUMN 1 FOREGROUND-COLOR 06.

       01 SS-TELA-BUSCA-SKU.
         05 BLANK SCREEN BACKGROUND-COLOR 06 FOREGROUND-COLOR 15.
         05 "Digite o SKU do produto:" LINE 13 COLUMN 25.
         05 INPUT-BUSCA-SKU PIC 9(4) TO WS-BUSCA-SKU LINE 13 COLUMN 50.

         
       01 SS-TELA-BUSCA-VALIDADE.
         05 BLANK SCREEN BACKGROUND-COLOR 06 FOREGROUND-COLOR 15.
         05 "Digite a data de validade (DD/MM/AAAA):" LINE 13 COLUMN 15.
         05 PIC 99 TO WS-BUSCA-DIA                    LINE 13 COLUMN 55.
         05 "/"                                       LINE 13 COLUMN 57.
         05 PIC 99 TO WS-BUSCA-MES                    LINE 13 COLUMN 58.
         05 "/"                                       LINE 13 COLUMN 60.
         05 PIC 9999 TO WS-BUSCA-ANO                  LINE 13 COLUMN 61.

       PROCEDURE DIVISION.
      **********************
      * Rotinas principais *
      **********************
       P-ABRE-ARQUIVO.
           OPEN I-O ARQUIVO
           IF WS-STATUS-ARQUIVO NOT = "00"
               IF WS-STATUS-ARQUIVO = "30"
               OPEN OUTPUT ARQUIVO
               MOVE "     Arquivo sendo criado...     " TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               CLOSE ARQUIVO
               GO TO P-ABRE-ARQUIVO
               ELSE
               MOVE "    Erro na abertura do arquivo  " TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               GO TO P-FIM-SAIDA.
       
       P-MENU-PRINCIPAL.
           DISPLAY SS-TELA-MENU
           ACCEPT SS-TELA-MENU
           
           IF WS-CODIGO-ESC = "C" OR "c"
               PERFORM P-CAD-ZERA-VARS THRU P-CAD-FIM

           ELSE IF WS-CODIGO-ESC = "R" OR "r"
               PERFORM P-DEL-INTRO THRU P-DEL-FIM

           ELSE IF WS-CODIGO-ESC = "E" OR "e"
               PERFORM P-EDIT-INTRO THRU P-EDIT-FIM

           ELSE IF WS-CODIGO-ESC = "M" OR "m"
               PERFORM P-LER-INTRO

           ELSE IF WS-CODIGO-ESC = "A" OR "a"
               PERFORM P-AVA-VALIDADE-INTRO THRU P-AVA-VALIDADE-FIM
               
           ELSE IF WS-CODIGO-ESC = "S" OR "s"
               GO TO P-FIM-QUER-SAIR
           ELSE
               MOVE "Opcao invalida!" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM.
    
           GO TO P-MENU-PRINCIPAL.
      ***********************
      * Rotinas de mensagem *
      ***********************
       P-MSG-ZERA.
           MOVE ZEROS TO WS-TEMPORIZADOR.
       P-MSG-DISPLAY.
           DISPLAY SS-TELA-MENSAGEM.
       P-MSG-TEMPO.
           ADD 1 TO WS-TEMPORIZADOR
           IF WS-TEMPORIZADOR < 2500
               GO TO P-MSG-TEMPO.
       P-MSG-FIM.
           MOVE SPACES TO WS-MENSAGEM
           EXIT.
       
      ***********************
      * Rotinas de cadastro *
      ***********************
       P-CAD-ZERA-VARS.
           MOVE ZEROS TO SKU WS-CONTADOR-ARQUIVO
           MOVE "N" TO WS-CHAVE-EOF
           START ARQUIVO KEY IS GREATER THAN SKU
           PERFORM P-LER-E-COMPUTAR UNTIL WS-CHAVE-EOF-SIM
           MOVE SPACES TO NOME
           MOVE ZEROS TO
               DIA MES ANO VALOR-CUSTO VALOR-VENDA QTD-ESTOQUE.

       P-CAD-DISPLAY.
           DISPLAY SS-TELA-CADASTRO
           ACCEPT SS-TELA-CADASTRO
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY
           IF WS-CODIGO-ESC = 01 GO TO P-CAD-FIM.
           
           PERFORM P-VALIDA-FORM
           IF WS-CHAVE-VALIDA-FORM = "N" GO TO P-CAD-DISPLAY.
       
       P-CAD-GRAVA.
               ADD 1 TO SKU
               WRITE PRODUTO INVALID KEY
                   MOVE "Erro ao gravar." TO WS-MENSAGEM
                   PERFORM P-MSG-ZERA THRU P-MSG-FIM
                   GO TO P-CAD-FIM.

       P-CAD-MSG-SUCESSO.
               MOVE "Registro gravado." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM.

       P-CAD-FIM.
           EXIT.

      ************************
      * Rotinas de validação *
      ************************
       P-VALIDA-FORM.
           
           MOVE "S" TO WS-CHAVE-VALIDA-FORM

           IF NOME EQUAL SPACES
               MOVE "Erro: preencha o nome do produto." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF DIA EQUAL ZEROS
               MOVE "Erro: preencha o dia de validade." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF MES EQUAL ZEROS
               MOVE "Erro: preencha o mes de validade." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF ANO EQUAL ZEROS
               MOVE "Erro: preencha o ano de validade." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF VALOR-CUSTO EQUAL ZEROS
               MOVE "Erro: preencha o valor de custo." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF VALOR-VENDA EQUAL ZEROS
               MOVE "Erro: preencha o valor de venda." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.
               
           IF MES > 12
               MOVE "Erro: o ano tem no maximo 12 meses." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF (MES = 01 OR
              MES = 03 OR
              MES = 05 OR
              MES = 07 OR
              MES = 08 OR
              MES = 10 OR
              MES = 12) AND
              DIA > 31
               MOVE "Erro: maximo de 31 dias nesse mes" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF (MES = 04 OR
              MES = 06 OR
              MES = 09 OR
              MES = 11) AND
              DIA > 30
               MOVE "Erro: maximo de 30 dias nesse mes" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.
           
           DIVIDE ANO BY 4 GIVING WS-ANO-DIVISAO REMAINDER WS-ANO-RESTO
           IF MES = 02 AND
              WS-ANO-RESTO = 0 AND
              DIA > 29
               MOVE "Erro: maximo de 29 dias nesse mes" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

           IF MES = 02 AND
              WS-ANO-RESTO NOT = 0 AND
              DIA > 28
               MOVE "Erro: maximo de 28 dias nesse mes" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               MOVE "N" TO WS-CHAVE-VALIDA-FORM.

      **********************
      * Rotinas de remoção *
      **********************
       P-DEL-INTRO.
           DISPLAY SS-TELA-BUSCA-SKU
           ACCEPT SS-TELA-BUSCA-SKU
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY.
           IF WS-CODIGO-ESC = 01
               GO TO P-DEL-FIM.
           
           MOVE WS-BUSCA-SKU TO SKU
           DELETE ARQUIVO RECORD INVALID KEY
               MOVE "Registro nao encontrado." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               GO TO P-DEL-FIM.

       P-DEL-SUCESSO.
           STRING "Registro de SKU " DELIMITED BY SIZE
                 WS-BUSCA-SKU DELIMITED BY SIZE
                 " removido." DELIMITED BY SIZE
                 INTO WS-MENSAGEM
           PERFORM P-MSG-ZERA THRU P-MSG-FIM.
       
       P-DEL-FIM.
           EXIT.
    
      *********************
      * Rotinas de edição *
      *********************
       P-EDIT-INTRO.
           DISPLAY SS-TELA-BUSCA-SKU
           ACCEPT SS-TELA-BUSCA-SKU
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY.
           IF WS-CODIGO-ESC = 01
               GO TO P-EDIT-FIM.
           
           MOVE WS-BUSCA-SKU TO SKU
           READ ARQUIVO INTO PRODUTO KEY IS SKU INVALID KEY
               MOVE "Registro nao encontrado." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               GO TO P-EDIT-FIM.
       
       P-EDIT-DISPLAY.
           DISPLAY SS-TELA-CADASTRO.
           ACCEPT SS-TELA-CADASTRO.
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY.
           IF WS-CODIGO-ESC = 01
               GO TO P-EDIT-FIM.
                          
           PERFORM P-VALIDA-FORM
           IF WS-CHAVE-VALIDA-FORM = "N" GO TO P-EDIT-DISPLAY.

       P-EDIT-REESCREVE.
           REWRITE PRODUTO INVALID KEY
               MOVE "Erro ao editar." TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               GO TO P-EDIT-FIM.

       P-EDIT-SUCESSO.
           STRING "Registro de SKU " DELIMITED BY SIZE
                 WS-BUSCA-SKU DELIMITED BY SIZE
                 " editado." DELIMITED BY SIZE
                 INTO WS-MENSAGEM
           PERFORM P-MSG-ZERA THRU P-MSG-FIM.

       P-EDIT-FIM.
           EXIT.

      **********************
      * Rotinas de leitura *
      **********************
       P-LER-INTRO.
           DISPLAY SS-TELA-MOSTRA-LISTA
           MOVE ZEROS TO SKU WS-CONTADOR-ARQUIVO
           MOVE "N" TO WS-CHAVE-EOF
           START ARQUIVO KEY IS GREATER THAN SKU
           PERFORM P-LER-E-EXIBIR UNTIL WS-CHAVE-EOF-SIM.

       P-LER-E-EXIBIR.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO WS-CHAVE-EOF.
           MOVE SKU TO WS-SKU
           MOVE NOME TO WS-NOME
           STRING DIA DELIMITED BY SIZE
               "/" DELIMITED BY SIZE
               MES DELIMITED BY SIZE
               "/" DELIMITED BY SIZE
               ANO DELIMITED BY SIZE
               INTO WS-VALIDADE
           MOVE VALOR-CUSTO TO WS-VALOR-CUSTO
           MOVE VALOR-VENDA TO WS-VALOR-VENDA
           MOVE QTD-ESTOQUE TO WS-QTD-ESTOQUE

           DIVIDE WS-CONTADOR-ARQUIVO BY 22
           GIVING WS-DIVISAO-CONTADOR REMAINDER WS-RESTO-CONTADOR
           
           IF WS-CONTADOR-ARQUIVO NOT = 0 AND
               WS-RESTO-CONTADOR = 0
               DISPLAY "Aperte o ENTER para prosseguir..."
               ACCEPT WS-CODIGO-ESC
               DISPLAY SS-TELA-MOSTRA-LISTA.

           IF WS-CHAVE-EOF-NAO
               DISPLAY WS-PRODUTO
               ADD 1 TO WS-CONTADOR-ARQUIVO
           ELSE
               DISPLAY "Total de " WS-CONTADOR-ARQUIVO " registros. - Ap
                       "erte o ENTER para prosseguir..."
               ACCEPT WS-CODIGO-ESC.
       
       P-LER-E-COMPUTAR.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO WS-CHAVE-EOF.
       
      ************************
      * Rotinas de avaliação *
      ************************       
       P-AVA-VALIDADE-INTRO.
           DISPLAY SS-TELA-BUSCA-VALIDADE
           ACCEPT SS-TELA-BUSCA-VALIDADE
       
           DISPLAY SS-TELA-MOSTRA-LISTA
           MOVE ZEROS TO SKU WS-CONTADOR-ARQUIVO WS-VALOR-TOTAL-CUSTO
               WS-VALOR-TOTAL-VENDA WS-TOTAL-QTD WS-VALOR-AUX
           MOVE "N" TO WS-CHAVE-EOF
           START ARQUIVO KEY IS GREATER THAN SKU
           PERFORM P-AVA-VALIDADE-EXIBE UNTIL WS-CHAVE-EOF-SIM
           
           GO TO P-AVA-VALIDADE-FIM.
       
       P-AVA-VALIDADE-EXIBE.
           READ ARQUIVO NEXT RECORD
           AT END MOVE "S" TO WS-CHAVE-EOF.
           MOVE SKU TO WS-SKU
           MOVE NOME TO WS-NOME
           STRING DIA DELIMITED BY SIZE
               "/" DELIMITED BY SIZE
               MES DELIMITED BY SIZE
               "/" DELIMITED BY SIZE
               ANO DELIMITED BY SIZE
               INTO WS-VALIDADE
           MOVE VALOR-CUSTO TO WS-VALOR-CUSTO
           MOVE VALOR-VENDA TO WS-VALOR-VENDA
           MOVE QTD-ESTOQUE TO WS-QTD-ESTOQUE

           DIVIDE WS-CONTADOR-ARQUIVO BY 22
           GIVING WS-DIVISAO-CONTADOR REMAINDER WS-RESTO-CONTADOR
           
           IF WS-CONTADOR-ARQUIVO NOT = 0 AND
               WS-RESTO-CONTADOR = 0
               DISPLAY "Aperte o ENTER para prosseguir..."
               ACCEPT WS-CODIGO-ESC
               DISPLAY SS-TELA-MOSTRA-LISTA.

           IF ((WS-BUSCA-ANO = ANO AND WS-BUSCA-MES = MES AND
                WS-BUSCA-DIA > DIA OR WS-BUSCA-DIA = DIA)
               OR
               (WS-BUSCA-ANO = ANO AND WS-BUSCA-MES > MES)
               OR
               WS-BUSCA-ANO > ANO)

               DISPLAY WS-PRODUTO

               MULTIPLY VALOR-CUSTO BY QTD-ESTOQUE GIVING
               WS-VALOR-AUX
               ADD WS-VALOR-AUX TO WS-VALOR-TOTAL-CUSTO

               MULTIPLY VALOR-VENDA BY QTD-ESTOQUE GIVING
               WS-VALOR-AUX
               ADD WS-VALOR-AUX TO WS-VALOR-TOTAL-VENDA

               ADD QTD-ESTOQUE TO WS-TOTAL-QTD

               ADD 1 TO WS-CONTADOR-ARQUIVO.
               
       P-AVA-VALIDADE-FIM.
           MOVE WS-VALOR-TOTAL-CUSTO TO WS-VALOR-AUX-PRINT
           DISPLAY "Perda de custo: R$" WS-VALOR-AUX-PRINT
           MOVE WS-VALOR-TOTAL-VENDA TO WS-VALOR-AUX-PRINT
           DISPLAY "Perda de venda: R$" WS-VALOR-AUX-PRINT

           SUBTRACT WS-VALOR-TOTAL-CUSTO FROM WS-VALOR-TOTAL-VENDA
               GIVING WS-VALOR-AUX
           MOVE WS-VALOR-AUX TO WS-VALOR-AUX-PRINT
           DISPLAY "Se tivesse vendido, o lucro seria: R$"
               WS-VALOR-AUX-PRINT
           DISPLAY "Total de " WS-TOTAL-QTD " produtos vencidos!!! - Ape
                                "rte o ENTER para prosseguir..."
           ACCEPT WS-CODIGO-ESC.
           EXIT.
      **************************
      * Rotinas de finalização *
      **************************
       P-FIM-QUER-SAIR.
           DISPLAY SS-TELA-FIM
           ACCEPT SS-TELA-FIM
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY
           IF WS-CODIGO-ESC = 01
               GO TO P-FIM-SAIDA
           ELSE
               GO TO P-MENU-PRINCIPAL.

       P-FIM-SAIDA.
           CLOSE ARQUIVO.

       P-FIM-EXIT.
           EXIT PROGRAM.

       P-FIM-STOP-RUN.
           STOP RUN.