;Opsi 6
JMP START
ORG 2000H        
DB 12            
DB 8             
DB 9             
DB 35            
DB 70            


START: NOP
       LDA 2000H          
       MOV B, A           
       LDA 2001H          
       CALL MULT          
       MOV C, A           
       
       LDA 2002H          
       ADD C              
                 
       
       LDA 2003H          
       SUB A             
       MOV C, A          
       
       LDA 2004H         
       ADD A            
       STA 3000H        

       HLT              


MULT:  MVI C, 00H         
       LOOP: ADD B        
             DCR D        
             JNZ LOOP     
       RET                
