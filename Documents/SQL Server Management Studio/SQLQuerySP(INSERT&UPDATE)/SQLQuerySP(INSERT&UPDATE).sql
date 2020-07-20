--ÉçÉOÉCÉìIDÇ™ë∂ç›ÇµÇΩÇÁUPDATEÅAë∂ç›ÇµÇ»Ç¢èÍçáINSERTÇ∑ÇÈSPçÏê¨
CREATE PROCEDURE uspUserInsertOrUpdate
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
		SET
			LoginId = SU.LoginId,
			name = SU.name,
			BirthDay = SU.BirthDay,
			Gender = SU.Gender
	WHEN NOT MATCHED THEN
		INSERT (LoginId, Name, BirthDay, Gender)
		VALUES (SU.LoginId, SU.Name, SU.BirthDay, SU.Gender);
END;