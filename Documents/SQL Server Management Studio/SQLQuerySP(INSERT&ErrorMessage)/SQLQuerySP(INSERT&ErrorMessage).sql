--ログインIDが存在したらフェラーメッセージを出力、存在しない場合INSERTするSP作成
CREATE PROCEDURE uspUserInsertOrError
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay DATE,
	@Gender CHAR(1),
	@ErrorMessage NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS (SELECT * FROM users WHERE LoginId = @LoginId)
		BEGIN
			SET @ErrorMessage = N'すでに存在するので登録できません';
		END
	ELSE
		BEGIN
			INSERT INTO users
				(LoginId, Name, BirthDay, Gender) 
			VALUES 
				(@LoginId, @Name, @BirthDay, @Gender);
		END
	END IF
END;
