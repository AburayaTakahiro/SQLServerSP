--INSERTの動作確認
EXEC uspUserInsertOrUpdate
	'aburaya',
	'123',
	'Yoshida',
	'1998-08-15',
	'F';

--UPDATEの動作確認
EXEC uspUserInsertOrUpdate
	'aburaya',
	'666',
	'Kobayashi',
	'1994-01-01',
	'F';