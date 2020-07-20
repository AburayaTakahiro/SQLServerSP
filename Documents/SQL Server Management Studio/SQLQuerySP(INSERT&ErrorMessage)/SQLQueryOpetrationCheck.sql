--INSERTする動作確認
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserInsertOrError
	'777',
	'Aburaya',
	'1993-06-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--エラーメッセージを表示する動作確認
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserInsertOrError
	'123',
	'Aburaya',
	'1993-06-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;