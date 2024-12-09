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
procedure hitungideal (var data:orang);
    begin
        with data do
        begin
            if (jeniskelamin = 'Pria') or (jeniskelamin = 'pria') then  
                ideal := (tinggi - 100) - (10/100 * (tinggi - 100))
            else if (jeniskelamin = 'Wanita') or (jeniskelamin = 'wanita') then
                ideal := (tinggi - 100) - (15/100 * (tinggi - 100))
            else
                writeln('Jenis Kelamin Tidak Valid');
        end;
    end;
