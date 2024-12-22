;Opsi 2
JMP START


ORG 2000H

DB 99
DB 35
DB 27
DB 8
DB 12


START: NOP



LDA 2003H       
MOV B, A        
LDA 2004H       
CALL MULT       
MOV E, A        


LDA 2001H
MOV B,A
LDA 2000H
SUB B
MOV C,A
LDA 2002H
ADD C
ADD E
STA 3000H
HLT             


MULT: MOV D, A       
      MVI A, 00H     
LOOP: ADD B          
      DCR D          
      JNZ LOOP       
      RET            

