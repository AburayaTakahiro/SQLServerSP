--登録の動作確認(Action = 1)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	1,
	'147',
	'Aoki',
	'1984-01-01',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--参照の動作確認(Action = 2)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	2,
	'456',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--更新の動作確認(Action = 3)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	3,
	'789',
	'Ando',
	'1995-07-09',
	'M',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--削除の動作確認(Action = 4)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	4,
	'147',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;

--エラーメッセージの動作確認(Action = 5)
DECLARE @ErrorMessage NVARCHAR(100);
EXEC uspUserCRUD
	5,
	'',
	'',
	'',
	'',
	@ErrorMessage OUTPUT;
PRINT @ErrorMessage;