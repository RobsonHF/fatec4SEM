       IDENTIFICATION DIVISION. 
       PROGRAM-ID. MENU. 
        
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
        

        
       SPECIAL-NAMES. 
        
           SYMBOLIC CHARACTERS 
               FKEY-10-VAL 
           ARE 11         
        
           CURSOR IS CURSOR-POSITION 
        
           CRT STATUS IS CRT-STATUS. 
        
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
        

       01  CURSOR-POSITION. 
           02  CURSOR-LINE    PIC 99. 
           02  CURSOR-COL     PIC 99. 
        

        
       01  CRT-STATUS. 
           03 KEY1            PIC X. 
           03 KEY2            PIC X. 
              88 FKEY-10      VALUE FKEY-10-VAL. 
           03 filler          PIC X. 
        

        
       01 ACCEPT-ITEM1  PIC X. 
       01 APPT-NAME     PIC X(160). 
       01 APPT-DAY      PIC XX. 
       01 APPT-MONTH    PIC XX. 
       01 APPT-YEAR     PIC XX. 
       01 APPT-HOUR     PIC XX. 
       01 APPT-MINUTE   PIC XX. 
       01 APPT-MERIDIEM PIC XX. 
       01 APPT-VERIFY   PIC X. 
       01 EMPTY-LINE    PIC X(80). 
        

       SCREEN SECTION. 
        
       01 MENU-SCREEN BLANK SCREEN FOREGROUND-COLOR 7
        BACKGROUND-COLOR 1. 
          02 MENU-SCREEN-2. 
             03 TITLE-BAR 
                FOREGROUND-COLOR 7 BACKGROUND-COLOR 4. 
                04 LINE 1 PIC X(80) FROM EMPTY-LINE. 
                04 LINE 1 COLUMN 32 VALUE "Daily Calendar". 
        
             03 LINE 7  COLUMN 26 
                PIC X TO ACCEPT-ITEM1. 
             03 VALUE " Show appointments for a day ". 
             03 LINE 9  COLUMN 26 
                PIC X TO ACCEPT-ITEM1. 
             03 VALUE " Schedule an appointment ". 
             03 LINE 11 COLUMN 26 
                PIC X TO ACCEPT-ITEM1. 
             03 VALUE " Cancel an appointment ". 
             03 LINE 13 COLUMN 26 
                PIC X TO ACCEPT-ITEM1. 
             03 VALUE " Print your appointments ". 
             03 HELP-TEXT 
         FOREGROUND-COLOR 6 BACKGROUND-COLOR 0. 
           04 LINE 19 COLUMN 12 
           VALUE 
           " Use the arrow keys to move the cursor among menu items. ". 
           04 LINE 20 COLUMN 12 
           VALUE 
           " Press <Return> when the cursor is at the desired item.  ". 
           04 LINE 21 COLUMN 12 
           VALUE 
           " Press <F10> to exit.                                    ". 
      
       01 SCHEDULE-SCREEN BLANK SCREEN. 
          02 TITLE-BAR 
             FOREGROUND-COLOR 7 BACKGROUND-COLOR 4. 
             03 LINE 1 PIC X(80) FROM EMPTY-LINE. 
             03 LINE 1 COLUMN 30 VALUE "Schedule Appointment". 
        
          02 FIELDS-TEXT 
             FOREGROUND-COLOR 7 BACKGROUND-COLOR 1. 
             03 LINE 5 VALUE " Description of Appointment: ". 
             03 LINE PLUS 4 VALUE " Date of Appointment (DD/MM/YY): ". 
             03 COLUMN PLUS 5 VALUE "/  /". 
             03 LINE PLUS 2 VALUE " Time of Appointment (HH:MM mm): ". 
             03 COLUMN PLUS 5 VALUE ":". 
        
          02 FIELDS-INPUT 
             FOREGROUND-COLOR 7 BACKGROUND-COLOR 0 AUTO. 
             03 LINE 6  PIC X(160) TO APPT-NAME. 
             03 LINE 9  COLUMN 36 PIC XX USING APPT-DAY. 
             03 LINE 9  COLUMN 39 PIC XX USING APPT-MONTH. 
             03 LINE 9  COLUMN 42 PIC XX USING APPT-YEAR. 
             03 LINE 11 COLUMN 36 PIC XX USING APPT-HOUR. 
             03 LINE 11 COLUMN 39 PIC XX USING APPT-MINUTE. 
             03 LINE 11 COLUMN 42 PIC XX USING APPT-MERIDIEM. 
        
          02 HELP-TEXT 
             FOREGROUND-COLOR 6 BACKGROUND-COLOR 0. 
             03 LINE 16 COLUMN 18 
                VALUE " Use Cursor Keys to move within the fields. ". 
             03 LINE 17 COLUMN 18 
                VALUE " Press <Tab> to enter next field.           ". 
             03 LINE 18 COLUMN 18 
                VALUE " Press <Return> when finished.              ". 
        
       01 VERIFY-SUBSCREEN FOREGROUND-COLOR 7 BACKGROUND-COLOR 1. 
          02 LINE 16 COLUMN 1 ERASE EOS. 
          02 LINE 17 COLUMN 25 VALUE " Is this entry correct? (Y/N): ". 
          02 PIC X USING APPT-VERIFY AUTO. 
        
        
       PROCEDURE DIVISION. 
       P0. 
        
           DISPLAY MENU-SCREEN. 
        

        
           MOVE 0 TO CURSOR-LINE, CURSOR-COL. 

        
           ACCEPT MENU-SCREEN. 
        
           IF KEY1 EQUAL "0" 
              PERFORM OPTION_CHOSEN 
        
           ELSE IF KEY1 EQUAL "1" AND FKEY-10 
              DISPLAY "You pressed the F10 key; exiting..." LINE 22. 
        
           STOP RUN. 
        
       OPTION_CHOSEN. 
        

        
           IF CURSOR-LINE = 7 
              DISPLAY "You selected Show Appointments" LINE 22. 
        
           IF CURSOR-LINE = 9 
              MOVE "01" TO APPT-DAY 
              MOVE "01" TO APPT-MONTH 
              MOVE "94" TO APPT-YEAR 
              MOVE "12" TO APPT-HOUR 
              MOVE "00" TO APPT-MINUTE 
              MOVE "AM" TO APPT-MERIDIEM 
              DISPLAY SCHEDULE-SCREEN 
        

        
              ACCEPT SCHEDULE-SCREEN 
        
              MOVE "Y" TO APPT-VERIFY 
              DISPLAY VERIFY-SUBSCREEN 
        

        
              ACCEPT VERIFY-SUBSCREEN. 
        
           IF CURSOR-LINE = 11 
              DISPLAY "You selected Cancel Appointments" LINE 22. 
        
           IF CURSOR-LINE = 13 
              DISPLAY "You selected Print Appointments" LINE 22. 
        
       END PROGRAM MENU. 