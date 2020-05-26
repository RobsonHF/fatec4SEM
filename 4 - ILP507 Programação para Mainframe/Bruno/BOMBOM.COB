       IDENTIFICATION DIVISION.
           PROGRAM-ID BOMBOM.
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
           VALUE OF FILE-ID IS "BOMBOM.DAT".
           01 PRODUTO.
               05 SKU                  PIC 9(04).
               05 NOME                 PIC X(30).
               05 VALIDADE.
                   10 DIA              PIC 99.
                   10 MES              PIC 99.
                   10 ANO              PIC 99.
               05 VALOR-GASTO          PIC 9(04)V99.
               05 VALOR-VENDA          PIC 9(04)V99.

       WORKING-STORAGE SECTION.
           77 WS-STATUS-ARQUIVO        PIC X(02).
           77 WS-MENSAGEM              PIC X(40).
           77 WS-TEMPORIZADOR          PIC 9(04).
           77 WS-CODIGO-ESC            PIC X(02).

       SCREEN SECTION.
       01 SS-TELA-MENSAGEM.
           05 BLANK SCREEN BACKGROUND-COLOR 04 FOREGROUND-COLOR 14.
           05 PIC X(40) FROM WS-MENSAGEM LINE 12 COLUMN 20.

       01 SS-TELA-MENU.
           05 BLANK SCREEN BACKGROUND-COLOR 03 FOREGROUND-COLOR 15.
           05 VALUE "Bomboniere BomBom"            LINE 03 COLUMN 20.
           05 VALUE "Escolha com a letra destacada"
                                                   LINE 05 COLUMN 20.
           05 VALUE "C" FOREGROUND-COLOR 14        LINE 07 COLUMN 20.
           05 VALUE "adastrar produto"             LINE 07 COLUMN 21.
           05 VALUE "L" FOREGROUND-COLOR 14        LINE 08 COLUMN 20.
           05 VALUE "ista completa de produtos"    LINE 08 COLUMN 21.
           05 VALUE "D" FOREGROUND-COLOR 14        LINE 09 COLUMN 20.
           05 VALUE "eletar produto"               LINE 09 COLUMN 21.
           05 VALUE "F" FOREGROUND-COLOR 14        LINE 13 COLUMN 20.
           05 VALUE "inalizar programa"            LINE 13 COLUMN 21.
           05 INPUT-MENU   PIC X TO WS-CODIGO-ESC
                          FOREGROUND-COLOR 14 LINE 15 COLUMN 60 AUTO.


       PROCEDURE DIVISION.
       P-INICIO.
       
       P-ABRE-ARQUIVO.
           OPEN I-O ARQUIVO
           IF WS-STATUS-ARQUIVO NOT = "00"
               IF WS-STATUS-ARQUIVO = "30"
                   OPEN OUTPUT ARQUIVO
                   MOVE "Arquivo sendo criado..." TO WS-MENSAGEM
                   PERFORM P-MSG-ZERA THRU P-MSG-FIM
                   CLOSE ARQUIVO
                   GO TO P-ABRE-ARQUIVO
                ELSE
                   MOVE "Erro na abertura do arquivo!" TO WS-MENSAGEM
                   PERFORM P-MSG-ZERA THRU P-MSG-FIM
                   GO TO P-FIM-SAIDA.

       P-MENU-PRINCIPAL.
           DISPLAY SS-TELA-MENU
           ACCEPT SS-TELA-MENU
           IF WS-CODIGO-ESC = "F" OR "f"
               GO TO P-FIM-SAIDA
           ELSE
               MOVE "Opcao invalida!" TO WS-MENSAGEM
               PERFORM P-MSG-ZERA THRU P-MSG-FIM
               GO TO P-MENU-PRINCIPAL.
       

      *----------------------Parágrafos de Mensagens
       P-MSG-ZERA.
           MOVE ZEROS TO WS-TEMPORIZADOR.

       P-MSG-MOSTRA.
           DISPLAY SS-TELA-MENSAGEM.
       
       P-MSG-TEMPO.
           ADD 1 TO WS-TEMPORIZADOR
           IF WS-TEMPORIZADOR < 3000
               GO TO P-MSG-TEMPO.

       P-MSG-FIM.
           MOVE SPACES TO WS-MENSAGEM
           EXIT.


      *----------------------Parágrafos de Saída
       P-FIM-SAIDA.
           CLOSE ARQUIVO.
       P-FIM-EXIT.
           EXIT PROGRAM.
       P-FIM-STOP-RUN.
           STOP RUN.
           