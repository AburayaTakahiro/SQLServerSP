--CRUDを一括で行うSPの作成
CREATE PROCEDURE uspUserCRUD
	@Action INT,
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay DATE,
	@Gender CHAR(1),
	@ErrorMessage NVARCHAR(100) OUT
AS
BEGIN
	--登録の処理
	IF @Action = 1
	BEGIN
		INSERT INTO users
			(LoginId, Name, BirthDay, Gender) 
		VALUES 
			(@LoginId, @Name, @BirthDay, @Gender);
	END
	--参照の処理
	ELSE IF @Action = 2
	BEGIN
		SELECT * FROM users WHERE LoginId = @LoginId;
	END
	--更新の処理
	ELSE IF @Action = 3
	BEGIN
		UPDATE users SET
			LoginId = @LoginId,
			Name = @Name,
			Birthday = @BirthDay,
			Gender = @Gender
		WHERE LoginId = @LoginId;
	END
	--削除の処理
	ELSE IF @Action = 4
	BEGIN
		DELETE FROM users WHERE LoginId = @LoginId;
	END
	--エラー時の処理
	ELSE
	BEGIN
		SET @ErrorMessage = N'Actionが存在しません';
	END
END;