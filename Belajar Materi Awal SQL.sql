create database umkm;
use umkm;

-- check table
describe umkm_jabar;
select * from umkm_jabar;

-- data di kota bandung
select * from umkm_jabar
where nama_kabupaten_kota = "Kota Bandung";

-- data umkm dari tahun 2019 dan disusun berdasarkan kategori usaha
select * from umkm_jabar
where tahun >= 2019
order by kategori_usaha, tahun;

-- soal sebelumnya tapi dibatasi 10 data saja
select * from umkm_jabar
where tahun >= 2019
order by kategori_usaha, tahun
limit 10; 

-- kategori apa saja yang tersedia dalam kolom kategori usaha
select distinct kategori_usaha from umkm_jabar;

-- tunjukkan data yang memiliki kategori fashion dan makanan
select * from umkm_jabar
where kategori_usaha in ("FASHION", "MAKANAN");

-- tunjukkan data yang memiliki kategori fashion di kab.karawang
select * from umkm_jabar
where kategori_usaha = "FASHION" and nama_kabupaten_kota = "kabupaten karawang";

-- tunjukkan seluruh data selain kategori kuliner, makanan, dan minuman
select * from umkm_jabar
where kategori_usaha not in ("KULINER", "MAKANAN", "MINUMAN");

-- dari tahun 2018 - 2020, bagaimana tren jumlah umkm di kab.tasikmalaya untuk usaha batik
select nama_kabupaten_kota, kategori_usaha, jumlah_umkm, tahun from umkm_jabar
where tahun >= 2018 and tahun <= 2020 and nama_kabupaten_kota = "KABUPATEN TASIKMALAYA" and kategori_usaha = "BATIK";

-- diantara kota bandung, kab.bandung, dan kab.bandung barat dimanakan umkm kuliner terpusat pada tahun 2021
select * from umkm_jabar
where nama_kabupaten_kota like "%BANDUNG%" and kategori_usaha = "KULINER" and tahun = 2021
order by jumlah_umkm desc;

-- kabupaten/kota mana yang memiliki kode mengandung angka 7 pada digit ke-3
select distinct kode_kabupaten_kota, nama_kabupaten_kota, nama_provinsi from umkm_jabar
where kode_kabupaten_kota like "__7%";

-- 10 kabupaten/ kota mana yang memiliki total umkm terbanyak
select nama_kabupaten_kota, sum(jumlah_umkm) as total_umkm from umkm.umkm_jabar
group by nama_kabupaten_kota
order by total_umkm desc;

select * from umkm.umkm_jabar;
