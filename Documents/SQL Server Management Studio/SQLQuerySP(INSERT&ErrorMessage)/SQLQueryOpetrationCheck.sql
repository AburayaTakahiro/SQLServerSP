--INSERT���铮��m�F
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserInsertOrError
	'777',
	'Aburaya',
	'1993-06-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�G���[���b�Z�[�W��\�����铮��m�F
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserInsertOrError
	'123',
	'Aburaya',
	'1993-06-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;