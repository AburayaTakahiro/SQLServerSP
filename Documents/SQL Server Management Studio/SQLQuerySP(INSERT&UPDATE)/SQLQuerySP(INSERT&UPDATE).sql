--���O�C��ID�����݂�����UPDATE(�X�V���t�̂݁j�A���݂��Ȃ��ꍇINSERT����SP�쐬
CREATE PROCEDURE uspUserInsertOrUpdate
	@ExecUser NVARCHAR(20),  --���s���[�U
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
		SET UpdatedDate = GETDATE() --UPDATE�̓������o��
		
	WHEN NOT MATCHED THEN
		INSERT (LoginId, Name, BirthDay, Gender)
		VALUES (SU.LoginId, SU.Name, SU.BirthDay, SU.Gender)
	OUTPUT
		FORMAT(GETDATE(),'yyyy/MM/dd HH:mm:ss') AS Date,
		@ExecUser AS ExecUser,
		$action AS RESULT_STRING;

END;