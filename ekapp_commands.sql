select * into OUTFILE 'users.txt'
	FIELDS TERMINATED BY ',\t'
	LINES TERMINATED BY '\r\n'
	from users;