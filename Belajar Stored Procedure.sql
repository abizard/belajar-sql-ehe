use umkm;

select * from umkm_jabar;

-- Membuat Stored Procedure
DELIMITER $$
create procedure getAllData ()
begin
	select * from umkm.umkm_jabar;
end $$
DELIMITER ;

-- Panggil Stored Procedure
call getAllData();

-- Cek Stored Procedure
show procedure status
where Db = 'umkm';

-- Hapus Stored Procedure
drop procedure getTotalRow2;

-- Stored Procedure Parameter
-- IN
DELIMITER $$
create procedure getDataUmkm 
(
	in nama_kab varchar (100)
)
begin
	select * from umkm_jabar
    where nama_kabupaten_kota = nama_kab;
end $$
DELIMITER ;

call getDataUmkm ('kabupaten karawang');

-- OUT (Mengeluarkan nilai yang disimpan dalam variabel parameter sehingga dapat digunakan diluar procedure)
DELIMITER $$
create procedure getTotalRow
(
	out jumlah_row int
)
begin
	select count(*) into jumlah_row from umkm_jabar;
end $$
DELIMITER ;

call getTotalRow(@jumlah_row);
select @jumlah_row;

-- INOUT
DELIMITER $$
create procedure getTotalRow2
(
	inout kode_kab int
)
begin
	select count(*) into kode_kab from umkm_jabar
    where kode_kabupaten_kota = kode_kab;
end $$
DELIMITER ;

set @kode_kab_kota = 3201;
call getTotalRow2(@kode_kab_kota);
select @kode_kab_kota;

-- LOOP
create table id_mahasiswa (id int);

select * from id_mahasiswa;
insert into id_mahasiswa values (0);

DELIMITER $$
create procedure buatIDMahasiswa ()
begin
	declare counter int;	
	set counter = 1;
    while counter <= 10 do
		insert into id_mahasiswa values (counter);
		set counter = counter + 1;
    end while;
end $$
DELIMITER ;

call buatIDMahasiswa();

-- IF THEN
DELIMITER $$
create procedure test
(
	in bilangan int,
    out hasil varchar(100)
)
begin
	if bilangan > 50 then set hasil = 'Lebih dari 50';
    else set hasil = 'Kurang dari sama dengan 50';
    end if;
end $$
DELIMITER ;

call test(1, @hasil_test);

select @hasil_test;

select * from umkm_jabar;