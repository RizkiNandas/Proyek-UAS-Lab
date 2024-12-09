program menjagaberatbadanideal;
uses crt;
type 
    orang = record //mengumpulkan data pengguna
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
    banyakorang:array [1..10] of orang; //menyimpan hingga 10 pengguna 
    jumlahorang,i:integer;
    lanjut:char;
procedure hitungideal (var data:orang); //prosedur untuk menghitung berat badan ideal
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
procedure hitungbmi(var data:orang); //prosedur untuk menghitung bmi
    begin
        with data do
        begin
            tinggibmi:=tinggi/100; //mengubah cm ke m
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

begin //main program
    repeat //perulangan jika pengguna ingin enghitung lagi
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
                repeat //perulangan jika jenis kelamin yang dimasukkan tidak sesuai
                write('Masukkan Jenis Kelamin(Pria/Wanita): ');
                readln(jeniskelamin);
                if (jeniskelamin<>'pria') or (jeniskelamin<>'Pria') or (jeniskelamin<>'wanita') or (jeniskelamin<>'Wanita') then 
                    writeln('Jenis Kelamin Tidak Valid'); //jika jenis kelamin yang dimasukkan tidk sesuai maka tidak valid
                until (jeniskelamin = 'pria') or (jeniskelamin = 'Pria') or (jeniskelamin = 'wanita') or (jeniskelamin = 'Wanita'); //diulang sampai jenis kelamin yang dimasukkan sesuai
            end;

            hitungbmi(banyakorang[i]); //memanggil prosedur untuk menghitung bmi
            hitungideal(banyakorang[i]); //memanggil prosedur untuk menghitung berat badan ideal
        end;
        clrscr;
        writeln('HASIL PERHITUNGAN');
        writeln('------------------');
        writeln;
        for i:=1 to jumlahorang do
        begin
            writeln('Orang ke ',i);
            writeln('~~~~~~~~~~~~');
            with banyakorang[i] do
                begin
                    writeln('Nama                       : ', nama);
                    writeln('Body Mass Index (BMI)      ',  ': ', bmi:0:2);
                    writeln('Kategori berat badan       : ', kategori);
                    writeln('Berat Badan Ideal          : ', ideal:0:2);
                    
        if kategori = 'Kekurangan Berat Badan' then //memunculkan tips sesuai kategori bmi
                        begin
                            writeln('Berikut Ini adalah Tips Untuk Menaikkan Berat Badan.');
                            writeln('1. Konsumsi makanan padat kalori dan bernutrisi seperti nasi, kentang, ayam, telur, ikan berlemak, kacang-kacangan, dan alpukat, serta makan 5-6 kali sehari dengan tambahan bahan seperti keju atau selai kacang.');
                            writeln('2. Kombinasikan dengan latihan kekuatan, seperti squat, deadlift, dan bench press, 3-5 kali seminggu untuk meningkatkan massa otot.');
                            writeln('3. Pastikan tidur cukup, minum smoothie tinggi kalori, dan berikan waktu istirahat pada otot untuk pemulihan optimal.');
                        end
                    else if kategori = 'Berat Badan Ideal' then
                        begin
                            writeln('Berikut Ini Adalah Hal Yang Bisa Dilakukan Untuk Mempertahankan Berat Badan Tetap Ideal');
                            writeln('1. Konsumsi makanan seimbang dengan porsi sesuai kebutuhan kalori harianmu, seperti karbohidrat kompleks (nasi merah, gandum), protein berkualitas (ayam, ikan, telur), lemak sehat (alpukat, kacang), serta sayur dan buah.');
                            writeln('2. Lakukan latihan kekuatan 2-3 kali seminggu untuk menjaga massa otot, ditambah aktivitas kardio ringan seperti jogging atau bersepeda untuk kesehatan jantung.');
                            writeln('3. Hindari makanan olahan berlebihan, tetap terhidrasi, dan tidur cukup untuk menjaga metabolisme tetap optimal.');
                        end
                    else
                        begin
                            writeln('Berikut Ini Adalah Yang Bisa Dilakukan Untuk Menurunkan Berat Badan.');
                            writeln('1. Konsumsi makanan rendah kalori namun kaya nutrisi, seperti sayuran, buah-buahan, protein tanpa lemak (ayam, ikan, tahu), dan karbohidrat kompleks (oat, quinoa).');
                            writeln('2. Kurangi gula dan lemak jenuh, serta pilih lemak sehat seperti alpukat atau kacang-kacangan dalam porsi kecil.');
                            writeln('3. Lakukan latihan kardio seperti lari atau bersepeda 3-5 kali seminggu untuk membakar kalori, dan kombinasikan dengan latihan kekuatan untuk meningkatkan metabolisme.');
                        end; 
                end;
            writeln;
    end;
    write('Apakah Anda Ingin Menghitung Lagi? (y/n): ');
    readln(lanjut);
    lanjut := upcase(lanjut);
    until (lanjut = 'N'); //jika pengguna ingin menghitung lagi
    clrscr;
    writeln('Terima Kasih Sudah Menggunakan Program Ini!!');
end.
