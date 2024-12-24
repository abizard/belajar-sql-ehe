use umkm;

select * from umkm.umkm_jabar;

-- coba having (setelah group by) --
select kategori_usaha, sum(jumlah_umkm) as total_umkm from umkm.umkm_jabar
group by kategori_usaha
having total_umkm > 30000
order by total_umkm desc;

-- 1. Berapa jumlah baris umkm_jabar --
select count(*) as total_row from umkm.umkm_jabar;

-- 2. Berapa jumlah umkm di kabupaten bekasi di tahun 2017 --
select nama_kabupaten_kota, sum(jumlah_umkm) as total_umkm from umkm.umkm_jabar
where nama_kabupaten_kota like '%bekasi' and tahun = 2017
group by nama_kabupaten_kota;

-- COBA SENDIRI : kategori usaha mana yang memiliki jumlah umkm terbanyak di tahun 2020 --
select kategori_usaha, sum(jumlah_umkm) as total_umkm_2020 from umkm.umkm_jabar
where tahun = 2020
group by kategori_usaha
order by total_umkm_2020 desc
limit 3;

select kategori_usaha, sum(jumlah_umkm) as total_umkm_2020 from umkm.umkm_jabar
group by kategori_usaha
order by total_umkm_2020 desc
limit 3;

-- 3. Bagaimana tren jumlah umkm di kabupaten karawang dari tahun 2017 - 2021 --
select tahun, sum(jumlah_umkm) as total_umkm_kab_karawang from umkm.umkm_jabar
where tahun >= 2017 and tahun <= 2021 and nama_kabupaten_kota = 'KABUPATEN KARAWANG'
group by tahun;

-- 4. Berapa jumlah rata-rata umkm setiap kategori usaha perkabupaten/kota di jawa barat tahun 2021 --
select kategori_usaha, avg(jumlah_umkm) as rata_rata_jumlah_umkm_2021 from umkm.umkm_jabar
where tahun = 2021
group by kategori_usaha
order by rata_rata_jumlah_umkm_2021 desc;

-- 5. Tentukan jumlah minimum dan maksimum dari kolom jumlah_umkm --
select min(jumlah_umkm) as jumlah_min_umkm, max(jumlah_umkm) as jumlah_max_umkm from umkm.umkm_jabar;

-- 6. Kabupaten atau kota apa yang memiliki jumlah umkm kurang dari 100.000 pada tahun 2020 --
select nama_kabupaten_kota, sum(jumlah_umkm) as total_umkm_2020 from umkm.umkm_jabar
where tahun = 2020
group by nama_kabupaten_kota
having total_umkm_2020 < 100000;