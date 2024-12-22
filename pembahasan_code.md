# PEMBAHASAN CODE : COA KELOMPOK 1
---
## Opsi 2 : Perhitungan (99 - 35 + 8 * 12 + 27)
### #Sub-tahap 2.1 : Inisialisasi dan (99 - 35)
```asm
ORG 2000H

DB 99
DB 35
DB 27
DB 8
DB 12

LDA 2003H       
MOV B, A        
LDA 2004H       
CALL MULT       
MOV E, A      
```
---
#### A. komponen yang terlibat
- A: Untuk memuat nilai operand dari memori.
- B: Menyimpan nilai operand untuk operasi perkalian.
- D: Menyimpan penghitung loop untuk operasi perkalian.
- E: Menyimpan hasil perkalian.
- Memori (2003H, 2004H): Lokasi data operand.
#### B. Eksekusi
- 2000H: 99
- 2001H: 35
- 2002H: 27
- 2003H: 8
- 2004H: 12
- Nilai 2003H (8) dimuat ke A dan dipindahkan ke B.
- Nilai 2004H (12) dimuat ke A.
- Subrutin MULT dipanggil untuk menghitung 8 * 12 menggunakan operasi penjumlahan berulang.
- Hasil perkalian 96 disimpan di E.
#### C. Kondisi
- A: Tidak berubah (digunakan sementara di subrutin).
- B: 8.
- D: Digunakan sebagai penghitung loop.
- E: 96.
- 2003H: 8.
- 2004H: 12.
- Flag: Tidak ada perubahan
---

### #Sub-tahap 2.2 : 2000H - 2001H + 2002H + (Hasil tahap 2)
```asm
LDA 2001H       
MOV B, A        
LDA 2000H       
SUB B           
MOV C, A        
LDA 2002H       
ADD C           
ADD E           
STA 3000H        
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan nilai sementara dari operasi.
- B: Untuk menyimpan operand.
- C: Untuk menyimpan hasil sementara dari operasi pengurangan.
- E: Menyimpan hasil perkalian dari tahap sebelumnya.
- Memori (2000H, 2001H, 2002H): Lokasi data operand.

#### B. Eksekusi
- Nilai 2001H (35) dimuat ke A dan dipindahkan ke B.
- Nilai 2000H (99) dimuat ke A, kemudian dikurangi nilai di B (99 - 35 = 64). Hasil disimpan di C.
- Nilai 2002H (27) dimuat ke A dan ditambahkan ke C (64 + 27 = 91).
- Nilai di E (96) ditambahkan ke hasil sebelumnya (91 + 96 = 187).
- Hasil akhir (187) disimpan di lokasi memori 3000H.

#### C. Kondisi
- A: 187.
- B: 35.
- C: 91 (hasil operasi sebelumnya).
- E: 96.
- 3000H: 187.
- Flag: Tidak ada perubahan.
---
### #Sub-tahap 2.3 : Subrutin `MULT`
```asm
MULT: MOV D, A       
      MVI A, 00H     
LOOP: ADD B          
      DCR D          
      JNZ LOOP       
      RET                   
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara dari operasi penjumlahan berulang.
- B: Operand tetap untuk operasi penjumlahan.
- D: Penghitung loop (jumlah iterasi = nilai operand kedua).
- Flag: Digunakan untuk memeriksa kondisi loop (Zero Flag).

#### B. Eksekusi
- Nilai di A dipindahkan ke D untuk menghitung jumlah iterasi.
- A diinisialisasi ke 00H sebagai akumulator.
- Operand di B ditambahkan ke A berulang kali hingga D mencapai nol.
- Jika D belum nol, lompat kembali ke label LOOP. Jika nol, subrutin selesai.

#### C. Kondisi
- A: Hasil akhir perkalian.
- B: Operand tetap.
- D: 0 (setelah loop selesai).
- Flag: Zero Flag disetel saat loop selesai.

### Hasil Akhir : pada memori 0x3000 `BB = 187`
---

## Opsi 6 : Perhitungan (12 * 8 + 9 - 35 + 70)
### #Sub-tahap 6.1 : Inisialisasi dan (2000H * 2001H)
```asm
ORG 2000H        
DB 12            
DB 8             
DB 9             
DB 35            
DB 70 

LDA 2000H          
MOV B, A           
LDA 2001H          
CALL MULT          
MOV C, A       
```
---
#### A. komponen yang terlibat
- 2000H: 12
- 2001H: 8
- 2002H: 9
- 2003H: 35
- 2004H: 70
- A: Untuk memuat data dari memori dan menyimpan hasil perkalian sementara.
- B: Menyimpan salah satu operand untuk operasi perkalian.
- C: Menyimpan hasil akhir dari perkalian.
- D: Menghitung iterasi loop dalam subrutin MULT.
- Memori (2000H, 2001H): Lokasi data operand.  
#### B. Eksekusi
- Nilai 2003H (8) dimuat ke A dan dipindahkan ke B.
- Nilai 2004H (12) dimuat ke A.
- Subrutin MULT dipanggil untuk menghitung 8 * 12 menggunakan operasi penjumlahan berulang.
- Hasil perkalian 96 disimpan di E.

#### C. Kondisi
- A: Tidak berubah setelah keluar dari subrutin.
- B: 12.
- C: 96.
- 2000H: 12.
- 2001H: 8.
- Flag: Tidak ada perubahan.
---

### #Sub-tahap 6.2 : C + 2002H
```asm
LDA 2002H          
ADD C          
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- C: Menyimpan hasil perkalian sebelumnya.
- Memori (2002H): Lokasi data operand.

#### B. Eksekusi
- Nilai 2002H (9) dimuat ke A.
- Nilai di A ditambahkan dengan nilai di C (96 + 9 = 105).

#### C. Kondisi
- A: 105 (hasil penjumlahan).
- C: Tidak berubah.
- 2002H: 9.
- Flag: Tidak ada perubahan.
---
### #Sub-tahap 6.3 : A - 2003H
```asm
LDA 2003H          
SUB A             
MOV C, A          
                
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- C: Untuk menyimpan hasil pengurangan.
- Memori (2003H): Lokasi data operand.

#### B. Eksekusi
- Nilai 2003H (35) dimuat ke A.
- Nilai di A dikurangi dengan nilai sebelumnya di A (105 - 35 = 70).
- Hasil pengurangan disimpan ke C.

#### C. Kondisi
- A: Tidak berubah setelah dipindahkan ke C.
- C: 70.
- 2003H: 35.
- Flag: Tidak ada perubahan.
---
#### #Sub-tahap 6.4 : A + 2004H
```asm
LDA 2004H         
ADD A            
STA 3000H        
     
                
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- Memori (2004H, 3000H): Lokasi data operand dan lokasi hasil akhir.

#### B. Eksekusi
- Nilai 2004H (70) dimuat ke A.
- Nilai di A ditambahkan dengan hasil pengurangan sebelumnya di C (70 + 70 = 140).
- Hasil akhir (140) disimpan ke lokasi memori 3000H.

#### C. Kondisi
- A: 140.
- C: Tidak berubah.
- 3000H: 140 (hasil akhir).
- Flag: Tidak ada perubahan.
---
### #Sub-tahap 6.5 : Subrutin `MULT`
```asm
MULT:  MVI C, 00H         
       LOOP: ADD B        
             DCR D        
             JNZ LOOP     
       RET                
                 
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- B: Menyimpan operand tetap untuk operasi penjumlahan.
- C: Tidak digunakan dengan benar di kode ini.
- D: Menyimpan penghitung loop.

#### B. Eksekusi
- Nilai A digunakan untuk inisialisasi penghitungan.
- Operand di B dijumlahkan berulang kali hingga penghitung D mencapai nol.
- DCR D mengurangi nilai D, dan jika belum nol, kembali ke LOOP.

#### C. Kondisi
- A: Hasil akhir perkalian.
- B: Operand tetap.
- D: 0 setelah loop selesai.
- Flag: Zero Flag disetel ketika loop selesai.

### Hasil Akhir : pada memori 0x3000 `8C = 140`
---
## Opsi 10 : Perhitungan (7 + 101 - 19 + 13 * 9)
### #Sub-tahap 10.1 : Inisialisasi dan 2000H * 2001H
```asm
ORG 2000H          

DB 13           
DB 9            
DB 7            
DB 101            
DB 19        

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
```
---
#### A. komponen yang terlibat
- 2000H: 13
- 2001H: 9
- 2002H: 7
- 2003H: 101
- 2004H: 19 
- A: Untuk memuat data dari memori dan menyimpan hasil sementara.
- B: Untuk menyimpan salah satu operand.
- C: Untuk menyimpan hasil perkalian.
- D: Menghitung iterasi loop dalam subrutin MULT.
- Memori (2000H, 2001H): Lokasi data operand.
#### B. Eksekusi
- Nilai 2000H (13) dimuat ke A, kemudian dipindahkan ke B.
- Nilai 2001H (9) dimuat ke A.
- Subrutin MULT dipanggil untuk menghitung 13 * 9 menggunakan penjumlahan berulang.
- Hasil perkalian (117) disimpan di C.

#### C. Kondisi
- A: Tidak berubah setelah keluar dari subrutin.
- B: 13.
- C: 117.
- 2000H: 13.
- 2001H: 9.
- Flag: Tidak ada perubahan.
---

### #Sub-tahap 10.2 : 2002H + 2003H
```asm
LDA 2002H
MOV D,A
LDA 2003H
ADD D
MOV D,A
       
```
---
#### A. komponen yang terlibat
- A: Untuk memuat data dari memori dan menyimpan hasil sementara.
- D: Untuk menyimpan hasil penjumlahan sementara.
- Memori (2002H, 2003H): Lokasi data operand.

#### B. Eksekusi
- Nilai 2002H (7) dimuat ke A dan dipindahkan ke D.
- Nilai 2003H (101) dimuat ke A.
- Nilai di A dijumlahkan dengan D (101 + 7 = 108).
- Hasil penjumlahan disimpan di D.

#### C. Kondisi
- A: Tidak berubah setelah dipindahkan ke D.
- D: 108.
- 2002H: 7.
- 2003H: 101.
- Flag: Tidak ada perubahan.

---

### #Sub-tahap 10.3 : D - 2004H
```asm
LDA 2004H
MOV E,A
MOV A,D
SUB E
   
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- E: Menyimpan operand pengurangan.
- D: Menyimpan nilai sebelumnya (hasil penjumlahan tahap 3).
- Memori (2004H): Lokasi data operand.

#### B. Eksekusi
- Nilai 2004H (19) dimuat ke A dan dipindahkan ke E.
- Nilai di D (108) dimuat kembali ke A.
- Nilai di A dikurangi dengan E (108 - 19 = 89).

#### C. Kondisi
- A: 89 (hasil pengurangan).
- D: Tidak berubah.
- E: 19.
- 2004H: 19.
- Flag: Tidak ada perubahan.

---

### #Sub-tahap 10.4 : A + C
```asm
ADD C
STA 3000H      
           
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- C: Menyimpan hasil perkalian.
- Memori (3000H): Lokasi hasil akhir.

#### B. Eksekusi
- Nilai di A (89) ditambahkan dengan hasil perkalian di C (117).
- Hasil penjumlahan (206) disimpan ke lokasi memori 3000H.

#### C. Kondisi
- A: 206.
- C: Tidak berubah.
- 3000H: 206 (hasil akhir).
- Flag: Tidak ada perubahan.
---
### #Sub-tahap 10.5 : Subrutin `MULT`
```asm
MULT:  MOV D, A       
       MVI A, 00H     
       LOOP: ADD B    
             DCR D    
             JNZ LOOP 
       RET            
      
```
---
#### A. komponen yang terlibat
- A: Untuk menyimpan hasil sementara.
- B: Menyimpan operand tetap untuk operasi penjumlahan.
- D: Menyimpan penghitung loop.

#### B. Eksekusi
- Nilai di A digunakan untuk inisialisasi penghitungan.
- Operand di B dijumlahkan berulang kali hingga penghitung D mencapai nol.
- DCR D mengurangi nilai D, dan jika belum nol, kembali ke LOOP.

#### C. Kondisi
- A: Hasil akhir perkalian.
- B: Operand tetap.
- D: 0 setelah loop selesai.
- Flag: Zero Flag disetel ketika loop selesai.

### Hasil Akhir : pada memori 0x3000 `CE = 206`

---

