--CRUD���ꊇ�ōs��SP�̍쐬
CREATE PROCEDURE uspUserCRUD
	@Action INT,
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay DATE,
	@Gender CHAR(1),
	@ErrorMessage NVARCHAR(100) OUT
AS
BEGIN
	--�o�^�̏���
	IF @Action = 1
	BEGIN
		INSERT INTO users
			(LoginId, Name, BirthDay, Gender) 
		VALUES 
			(@LoginId, @Name, @BirthDay, @Gender);
	END
	--�Q�Ƃ̏���
	ELSE IF @Action = 2
	BEGIN
		SELECT * FROM users WHERE LoginId = @LoginId;
	END
	--�X�V�̏���
	ELSE IF @Action = 3
	BEGIN
		UPDATE users SET
			LoginId = @LoginId,
			Name = @Name,
			Birthday = @BirthDay,
			Gender = @Gender
		WHERE LoginId = @LoginId;
	END
	--�폜�̏���
	ELSE IF @Action = 4
	BEGIN
		DELETE FROM users WHERE LoginId = @LoginId;
	END
	--�G���[���̏���
	ELSE
	BEGIN
		SET @ErrorMessage = N'Action�����݂��܂���';
	END
END;