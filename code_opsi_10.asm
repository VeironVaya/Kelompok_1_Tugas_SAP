; Opsi 10
JMP START
ORG 2000H          

DB 13           
DB 9            
DB 7            
DB 101            
DB 19            
    


START: NOP
       
       
       LDA 2000H                
       MOV B, A        
       LDA 2001H      
       CALL MULT 
       MOV C, A       

       LDA 2002H
       MOV D,A
       LDA 2003H
       ADD D
       MOV D,A
       LDA 2004H
       MOV E,A
       MOV A,D
       SUB E
       ADD C
       STA 3000H      
       HLT            


MULT:  MOV D, A       
       MVI A, 00H     
       LOOP: ADD B    
             DCR D    
             JNZ LOOP 
       RET





