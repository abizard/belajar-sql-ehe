use universitas_2;

-- Belajar String --

create table mahasiswa_2(
	nama_awal_mahasiswa varchar(50),
    nama_akhir_mahasiswa varchar(50),
    kelas varchar(1),
    tanggal_lahir timestamp,
    instagram varchar(50)
);

insert into mahasiswa_2 (nama_awal_mahasiswa, nama_akhir_mahasiswa, kelas, tanggal_lahir, instagram)
values
	('Amanda', 'Gunawan', "A", '1998-11-11 13:23:44', 'mandasq'),
    ('Andi', 'Rusanto', "B", '1999-10-21 11:22:04', 'andiboi89'),
    ('Aruman', 'Budiman', "C", '2000-01-31 11:03:22', 'rumanzz'),
    ('Ashari', 'Krisna', "E", '1999-09-22 03:23:43', 'irasha22');
    
select * from mahasiswa_2;
select *, concat_ws(' ', nama_awal_mahasiswa, nama_akhir_mahasiswa) as nama_lengkap_mahasiswa from mahasiswa_2;
select *, 
-- concat_ws(' ', nama_awal_mahasiswa, nama_akhir_mahasiswa) as nama_lengkap_mahasiswa, 
-- concat_ws('/', 'www.instagram.com', instagram) as url_instagram,
-- substr(concat_ws('/', 'www.instagram.com', instagram), 19, 10) as username_instagram,
-- lower(reverse(nama_awal_mahasiswa)) as reverse_nama_awal_mahasiswa,
-- lpad(nama_awal_mahasiswa,20,kelas) as lpad,
-- rpad(nama_awal_mahasiswa,20,kelas) as rpad
replace(concat_ws('/', 'www.instagram.com', instagram), 'instagram', 'tiktok') as url_tiktok
from mahasiswa_2;

-- Belajar Date --
select *, 
date(tanggal_lahir) as tanggal_lahir_simplified,
timestamp(date(tanggal_lahir)) as tanggal_lahir_2,
month(tanggal_lahir) as bulan_lahir,
year(tanggal_lahir) as tahun_lahir,
day(tanggal_lahir) as tanggal_lahir,
date_format(tanggal_lahir, '%M') AS nama_bulan,
date(concat_ws('-',year(tanggal_lahir),month(tanggal_lahir),day(tanggal_lahir))) as tanggal_lahir_concat
from mahasiswa_2;

select * from mahasiswa_2;

select datediff(andi, amanda) as selisih_hari
from (
	select 
    (
		select tanggal_lahir from mahasiswa_2
        where nama_awal_mahasiswa = 'Amanda'
	) as amanda,
    (
		select tanggal_lahir from mahasiswa_2
        where nama_awal_mahasiswa = 'Andi'
    ) as andi
) amanda_andi;

select *, 
floor(datediff(current_date(), date(tanggal_lahir)) / 365) as umur_mahasiswa,
date_add(tanggal_lahir, interval 30 year) as tanggal_ultah_ke30
from mahasiswa_2;