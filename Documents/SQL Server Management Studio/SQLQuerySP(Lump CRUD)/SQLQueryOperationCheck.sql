--�o�^�̓���m�F(Action = 1)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	1,
	'147',
	'Aoki',
	'1984-01-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�Q�Ƃ̓���m�F(Action = 2)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	2,
	'456',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�X�V�̓���m�F(Action = 3)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	3,
	'789',
	'Ando',
	'1995-07-09',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�폜�̓���m�F(Action = 4)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	4,
	'147',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--�G���[���b�Z�[�W�̓���m�F(Action = 5)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	5,
	'',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;