--�o�^SP�̓���m�F
DECLARE @ErrorMessage1 NVARCHAR(100);
EXEC uspUserInsert
	'445',
	'Aburaya',
	'1993-06-01',
	'M',
	@ErrorMessage1 OUTPUT;
PRINT @ErrorMessage1;

--�Q��SP�̓���m�F
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserSelect
	'123',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�X�VSP�̓���m�F
DECLARE @ErrorMessage2 NVARCHAR(100);
EXEC uspUserUpdate
	'445',
	'Toyota',
	'1995-01-21',
	'F',
	@ErrorMessage2 OUTPUT;
PRINT @ErrorMessage2;

--�폜SP�̓���m�F
DECLARE @ErrorMessage3 NVARCHAR(100);
EXEC uspUserDelete
	'445',
	@ErrorMessage3 OUTPUT;
PRINT @ErrorMessage3;