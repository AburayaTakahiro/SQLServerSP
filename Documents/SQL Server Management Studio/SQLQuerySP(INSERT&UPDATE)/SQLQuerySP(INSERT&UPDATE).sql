--ログインIDが存在したらUPDATE(更新日付のみ）、存在しない場合INSERTするSP作成
CREATE PROCEDURE uspUserInsertOrUpdate
	@ExecUser NVARCHAR(20),  --実行ユーザ
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay DATE,
	@Gender CHAR(1)
AS
BEGIN
	MERGE INTO users AS US
	USING
		(SELECT @LoginId AS LoginId,
		        @Name AS Name,
				@BirthDay AS BirthDay,
				@Gender AS Gender
		)AS SU
	ON
		(US.LoginId = SU.LoginId)
	WHEN MATCHED THEN
		UPDATE
		SET UpdatedDate = GETDATE() --UPDATEの日時を出力
		
	WHEN NOT MATCHED THEN
		INSERT (LoginId, Name, BirthDay, Gender)
		VALUES (SU.LoginId, SU.Name, SU.BirthDay, SU.Gender)
	OUTPUT
		FORMAT(GETDATE(),'yyyy/MM/dd HH:mm:ss') AS Date,
		@ExecUser AS ExecUser,
		$action AS RESULT_STRING;

END;