--drop table users;
--create table users(
--	user_id int(11) PRIMARY KEY,
--	name varchar(32) NOT NULL,
--	password varchar(32) NOT NULL,
--	email varchar(255) not null,
--	category varchar(11) not null,
--	party_id int(11)  not null,
--	hasVoted varchar(8) not null,
--	vote_count int(11) not null,
--	post_applied varchar(11)
--);
--LOAD DATA INFILE "users.dat" INTO TABLE users COLUMNS TERMINATED BY ',\t'LINES TERMINATED BY '\r\n';
--select * from users;
--select * from ekapp.users into "users.dat";

--//LOAD DATA INFILE "users.dat" INTO TABLE users COLUMNS TERMINATED BY ','LINES TERMINATED BY '\r\n';



--LOAD DATA INFILE "users.dat" INTO TABLE users COLUMNS TERMINATED BY ','LINES TERMINATED BY '\r\n';

--select * from users;

--create table expmt (oos LONGBLOB);
--describe expmt;
--DROP TABLE party;
--create table party(
--	party_id int(11) PRIMARY KEY,
--	name VARCHAR(32) NOT NULL,
--	agenda_short TEXT NOT NULL,
--	agenda TEXT NOT NULL,
--	email varchar(255),
--	candidates BLOB
--);
--
--ALTER TABLE PARTY ADD agenda_shore TEXT NOT NULL;
--LOAD DATA INFILE "party.dat" INTO TABLE party COLUMNS TERMINATED BY ';\t'LINES TERMINATED BY '~\r\n';
--describe party;
--SELECT * from party;
--sElect * from users;
--describe users;
--select * from ekapp.users into users.dat;