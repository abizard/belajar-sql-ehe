create database universitas_2;
use universitas_2;

drop table wali_kelas;

-- BELAJAR JOIN N SUBQUERY --

create table mahasiswa(
	nama_mahasiswa varchar(50),
    nilai_ujian integer,
    kelas varchar(1),
    gender varchar(1)
);

insert into mahasiswa (nama_mahasiswa, nilai_ujian, kelas, gender)
values
	('Amanda', 65, "A", "W"),
    ('Ashari', 90, "B", "P"),
    ('Nadia', 60, "A", "W"),
    ('Andi', 40, "B", "P"),
    ('Diana', 75, "B", "W"),
    ('Nisa', 70, "B", "W"),
    ('Aruman', 80, "C", "P"),
    ('Gilang', 85, "C", "P"),
    ('Reza', 90, "C", "P");
    
select * from mahasiswa;
    
create table wali_kelas(
	nama_wali_kelas varchar(50),
    kelas varchar(1)
);

insert into wali_kelas (nama_wali_kelas, kelas)
values
	('Sutarno', "A"),
    ('Jonathan', "B"),
    ('Vania', "C"),
    ('Raissa', "D");
    
select * from wali_kelas;
 
 -- Inner Join --
select nama_wali_kelas, wali_kelas.kelas, nama_mahasiswa from mahasiswa
inner join wali_kelas
on mahasiswa.kelas = wali_kelas.kelas
order by wali_kelas.kelas;

-- Left Join --
select nama_wali_kelas, wali_kelas.kelas, nama_mahasiswa from wali_kelas
left join mahasiswa
on wali_kelas.kelas = mahasiswa.kelas;

-- Right Join --
select nama_wali_kelas, mahasiswa.kelas, nama_mahasiswa from wali_kelas
right join mahasiswa
on wali_kelas.kelas = mahasiswa.kelas;

-- Cross Join --
select nama_wali_kelas, wali_kelas.kelas, mahasiswa.kelas as kelas_mahasiswa, nama_mahasiswa from wali_kelas
cross join mahasiswa
order by kelas asc;

-- Subquery --
select nama_wali_kelas from wali_kelas
where wali_kelas.kelas not in (
	select distinct kelas from mahasiswa
);

-- 1. Siapakah mahasiswa Pak Jonathan yang mendapat nilai diatas 70 --
select nama_mahasiswa, nilai_ujian from mahasiswa
where kelas = (select kelas from wali_kelas where nama_wali_kelas = 'Jonathan')
and nilai_ujian > 70;

select mahasiswa.nama_mahasiswa, mahasiswa.nilai_ujian from mahasiswa
inner join wali_kelas
on mahasiswa.kelas = wali_kelas.kelas
where mahasiswa.nilai_ujian > 70 and wali_kelas.nama_wali_kelas = 'Jonathan';

-- 2. Siapa saja nama mahasiswa yang memiliki nilai ujian lebih dari rata-rata keseluruhan --
select nama_mahasiswa, nilai_ujian from mahasiswa
where nilai_ujian > (
	select avg(nilai_ujian) from mahasiswa
);