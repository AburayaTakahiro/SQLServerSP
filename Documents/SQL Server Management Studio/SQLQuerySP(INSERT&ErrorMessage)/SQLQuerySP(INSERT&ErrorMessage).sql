--���O�C��ID�����݂�����UPDATE�A���݂��Ȃ��ꍇ�G���[���b�Z�[�W���o�͂���SP�쐬
CREATE PROCEDURE uspUserInsertOrError
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay DATE,
	@Gender CHAR(1),
	@ErrorMessage NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS (SELECT *FROM users WHERE LoginId = @LoginId)
	BEGIN
		SET @ErrorMessage = N'���łɑ��݂���̂œo�^�ł��܂���';
	END
	ELSE
	BEGIN
		INSERT INTO users
			(LoginId, Name, BirthDay, Gender) 
		VALUES 
			(@LoginId, @Name, @BirthDay, @Gender);
	END
END;