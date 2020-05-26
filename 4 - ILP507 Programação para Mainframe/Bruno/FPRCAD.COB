      ***********************************
      * Authors: Fernanda Pinheiro Reis *
      * Data: 2020-05                   *
      * Proposta: Acadêmica             *
      ***********************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. FPRCAD.
           AUTHOR. Fernanda Pinheiro Reis.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO ASSIGN TO DISK
           ORGANIZATION            IS INDEXED
           ACCESS MODE             IS DYNAMIC
           RECORD KEY              IS RA
           ALTERNATE RECORD KEY    IS NOME WITH DUPLICATES
           FILE STATUS             IS WS-STATUS-ARQUIVO.
        
       DATA DIVISION.
       FILE SECTION.
       FD ARQUIVO
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "FPRCAD.DAT".
           01 ALUNO.
               05 RA               PIC 9(06).
               05 NOME             PIC X(30).
               05 EMAIL            PIC X(30).

       WORKING-STORAGE SECTION.
           77 WS-STATUS-ARQUIVO            PIC X(02).
           77 WS-MENSAGEM                  PIC X(48) VALUE SPACES.
           77 WS-TEMPORIZADOR              PIC 9(06) VALUE ZEROS.
           77 WS-MENU-OPCAO                PIC X(01) VALUE SPACES.
           77 WS-CODIGO-ESC                PIC X(02).

       SCREEN SECTION.
       01 BLANK-SCREEN.
           05. BLANK SCREEN.

       PROCEDURE DIVISION.
       P-INICIO.

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
           DISPLAY "MENU-PRINCIPAL".
       
      ***********************
      * Rotinas de mensagem *
      ***********************
       P-MSG-ZERA.
           MOVE ZEROS TO WS-TEMPORIZADOR.
       P-MSG-DISPLAY.
           DISPLAY BLANK-SCREEN.
           DISPLAY WS-MENSAGEM.
       P-MSG-TEMPO.
           ADD 1 TO WS-TEMPORIZADOR
           IF WS-TEMPORIZADOR < 2000
               GO TO P-MSG-TEMPO
           ELSE
               DISPLAY BLANK-SCREEN.
       P-MSG-FIM.
           MOVE SPACES TO WS-MENSAGEM
           EXIT.
       
      **************************
      * Rotinas de finalização *
      **************************
       P-FIM-QUER-SAIR.
           ACCEPT WS-CODIGO-ESC FROM ESCAPE KEY
           
           IF WS-CODIGO-ESC = 01
               GO TO P-FIM-SAIDA
           ELSE
               GO TO P-MENU-PRINCIPAL.

       P-FIM-SAIDA.
           DISPLAY BLANK-SCREEN
           CLOSE ARQUIVO.
           
       P-FIM-EXIT.
           EXIT PROGRAM.
       P-FIM-STOP-RUN.
           STOP RUN.