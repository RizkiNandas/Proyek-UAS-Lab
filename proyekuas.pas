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
procedure hitungbmi(var data:orang);
    begin
        with data do
        begin
            tinggibmi:=tinggi/100; 
            bmi := berat / (tinggibmi * tinggibmi);
            if bmi < 18.5 then
                kategori:= 'Kekurangan Berat Badan'
            else if (bmi >= 18.5) and (bmi <= 24.9) then
                kategori:= 'Berat Badan Ideal'
            else if (bmi >= 25) and (bmi <= 29.9) then
                kategori:= 'Kelebihan Berat Badan'
            else
                kategori:= 'Kegemukan';
            
        end;
    end;

begin
    repeat
    clrscr;
    writeln('Selamat Datang di Program Menjaga Berat Badan Ideal!!');
    writeln('=====================================================');
    writeln;
    write('Masukkan Jumlah Orang Yang Ingin Dihitung: ');
    readln(jumlahorang);
    for i := 1 to jumlahorang do
        begin
            writeln('Data Orang ke ', i);
            with banyakorang[i] do
            begin
                write('Masukkan Nama                      : ');
                readln(nama);
                write('Masukkan Berat Badan(Kg)           : ');
                readln(berat);
                write('Masukkan Tinggi Badan(Cm)          : ');
                readln(tinggi);
