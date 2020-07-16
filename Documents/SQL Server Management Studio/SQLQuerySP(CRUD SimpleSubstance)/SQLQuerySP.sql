--データを登録するSPの作成
CREATE PROCEDURE uspUserInsert
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay Date,
	@Gender CHAR(1),
	@ErrorMessage1 NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS
	(SELECT *FROM users WHERE LoginId = @LoginId)
	BEGIN
		SET @ErrorMessage1 = N'すでに存在するので登録できません';
	END
	ELSE
	BEGIN
		INSERT INTO users
			(LoginId, Name, BirthDay, Gender) 
		VALUES 
			(@LoginId, @Name, @BirthDay, @Gender);
	END
END;

--データを参照するSPの作成
CREATE PROCEDURE uspUserSelect
	@LoginId NVARCHAR(50),
	@ErrorMessage NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS 
	(SELECT * FROM users WHERE LoginID = @LoginId)
	BEGIN
		SELECT * FROM users WHERE LoginId = @LoginId;
	END
	ELSE
	BEGIN
		SET @ErrorMessage = N'LoginIdが存在しません';
	END
END;

--データを更新するSPの作成
CREATE PROCEDURE uspUserUpdate
	@LoginId NVARCHAR(50),
	@Name NVARCHAR(50),
	@BirthDay Date,
	@Gender CHAR(1),
	@ErrorMessage2 NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS (SELECT * FROM users WHERE LoginId = @LoginId)
	BEGIN
		UPDATE users SET
			LoginId = @LoginId,
			Name = @Name,
			Birthday = @BirthDay,
			Gender = @Gender
		WHERE LoginId = @LoginId;
	END
	ELSE
	BEGIN
		SET @ErrorMessage2 = N'LoginIdが存在しません';
	END
END;

--データを削除するSPの作成
CREATE PROCEDURE uspUserDelete
	@LoinId NVARCHAR(50),
	@ErrorMessage3 NVARCHAR(100) OUT
AS
BEGIN
	IF EXISTS
		(SELECT * FROM users　WHERE LoginId = @LoinId)
	BEGIN
		DELETE FROM users WHERE LoginId = @LoinId;
	END
	ELSE
	BEGIN
		SET @ErrorMessage3 = N'LoginIdが存在しません';
	END
END;

