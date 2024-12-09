program menjagaberatbadanideal;
uses crt;
type 
    orang = record
    nama:string;
    tinggi:real;
    tinggibmi:real;
    berat:real;
    bmi:real;
    kategori:string;
    jeniskelamin:string;
    ideal:real;
    end;
var
    banyakorang:array [1..10] of orang;
    jumlahorang,i:integer;
    lanjut:char;
