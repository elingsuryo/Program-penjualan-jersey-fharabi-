.model small
.code
org 100h
start:
	jmp mulai
nama		db 13,10,'Nama Lengkap Pelanggan	:$'
hp		db 13,10,'No.  HP?Telp 			:$'
lanjut	db 13,10,'Lanjut Tekan Y untuk lanjut=====> $'
tampung_nama	db 30,?,30 dup(?)
tampung_hp		db 30,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j db 15

daftar	db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|				          TII Store                         |'
		db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|			         Harga jersey Negara                     |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| No | Nama Negara | Ukuran   |   Warna   | Harga              |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 01 |  Argentina  |    XL    |Putih Biru |  Rp.250.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 02 |   France    |    L     |   Biru    |  Rp.200.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 03 |  Kroasia    |    L     |Putih Merah|  Rp.150.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 04 |  Indonesia  |    L     |  Merah    |  Rp.300.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|','$'

daftar2	db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|				         TII Store                         |'
		db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|			         Harga jersey Negara                     |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| No | Nama Negara | Ukuran   |   Warna   | Harga              |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 05 |   Maroko    |    M     |   Merah   |  Rp.200.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 06 |   Jepang    |    XL    |   Biru    |  Rp.210.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 07 |  Portugal   |    M     |   Merah   |  Rp.150.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 08 |Korea Selatan|    S     |   Merah   |  Rp.100.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|','$'

daftar3	db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|				         TII Store                         |'
		db 13,10,'|--------------------------------------------------------------|'
		db 13,10,'|			         Harga jersey Club                       |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| No | Nama Negara | Ukuran   |   Warna   | Harga              |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|'
		db 13,10,'| 09 |   Chelsea   |    M     |   Biru    |  Rp.160.000        |'
		db 13,10,'|----+-------------+----------+-----------+--------------------|','$'
	

error		db 13,10,'Kode yang Pelanggan masukkan salah $'
pilih_mtr	db 13,10,'Silahkan Masukkan kode nomor : $'
success	db 13,10,'Selamat Anda Bersahil $'

	mulai:
	mov ah,09h
	lea dx,nama
    int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,hp
	int 21h
	mov ah,0ah
	lea dx,tampung_hp
	int 21h
	push dx
  
	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	je page2
	jne error_msg

page2:
	mov ah,09h
	mov dx,offset daftar2
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	je page3
	jne error_msg

page3:
	mov ah,09h
	mov dx,offset daftar3
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	je proses
	jne error_msg

error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

proses:
	mov ah,09h
	mov dx,offset pilih_mtr
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3 

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5

	cmp bh,'0'
	cmp bl,'6'
	je hasil6

	cmp bh,'0'
	cmp bl,'7'
	je hasil7

	cmp bh,'0'
	cmp bl,'8'
	je hasil8

	cmp bh,'0'
	cmp bl,'9'
	je hasil9

	

	

	jne error_msg
;------------------------------------------

hasil1:
	 mov ah,09h
	 lea dx,teks1
	 int 21h
	 int 20h
hasil2:
	 mov ah,09h
	 lea dx,teks2
	 int 21h
	 int 20h
hasil3:
	 mov ah,09h
	 lea dx,teks3
	 int 21h
	 int 20h
hasil4:
	 mov ah,09h
	 lea dx,teks4
	 int 21h
	 int 20h
hasil5:
	 mov ah,09h
	 lea dx,teks5
	 int 21h
	 int 20h
hasil6:
	 mov ah,09h
	 lea dx,teks6
	 int 21h
	 int 20h
hasil7:
	 mov ah,09h
	 lea dx,teks7
	 int 21h
	 int 20h
hasil8:
	 mov ah,09h
	 lea dx,teks8
	 int 21h
	 int 20h
hasil9:
	 mov ah,09h
	 lea dx,teks9
	 int 21h
	 int 20


;------------------------------------------
teks1	 db 13,10,'=>Anda memilih Argentina'
	 db 13,10,'=>Dengan ukuran XL'
	 db 13,10,'=>Dengan Warna Putih Biru'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp250.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks2	 db 13,10,'=>Anda memilih France'
	 db 13,10,'=>Dengan ukuran L'
	 db 13,10,'=>Dengan Warna Biru'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp200.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks3	 db 13,10,'=>Anda memilih Kroasia'
	 db 13,10,'=>Dengan ukuran L'
	 db 13,10,'=>Dengan Warna Putih Merah'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp150.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks4	 db 13,10,'=>Anda memilih Indonesia'
	 db 13,10,'=>Dengan ukuran L'
	 db 13,10,'=>Dengan Warna Merah'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp300.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks5	 db 13,10,'=>Anda memilih Maroko'
	 db 13,10,'=>Dengan ukuran M'
	 db 13,10,'=>Dengan Warna Merah'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp200.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks6	 db 13,10,'=>Anda memilih Jepang'
	 db 13,10,'=>Dengan ukuran XL'
	 db 13,10,'=>Dengan Warna  Biru'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp210.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks7	 db 13,10,'=>Anda memilih Portugal'
	 db 13,10,'=>Dengan ukuran M'
	 db 13,10,'=>Dengan Warna Merah'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp150.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks8	 db 13,10,'=>Anda memilih Korsel'
	 db 13,10,'=>Dengan ukuran S'
	 db 13,10,'=>Dengan Warna Merah'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp100.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'

teks9	 db 13,10,'=>Anda memilih Chelsea'
	 db 13,10,'=>Dengan ukuran M'
	 db 13,10,'=>Dengan Warna  Biru'
	 db 13,10,'=>Dan Total yang arus di bayar = Rp160.000'
	 db 13,10,'=>Terima Kasih dan selamat berbelanja $'



end start