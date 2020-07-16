--テーブルの作成
CREATE TABLE users (
	ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	LoginId VARCHAR(50) NULL,
	Name VARCHAR(50) NULL,
	Birthday DATE NULL,
	Gender CHAR(1) NULL
);

--データの挿入
INSERT INTO users
	(LoginId, Name, Birthday, Gender)
	VALUES
	('123', 'Yamada', '1980-02-15', 'M'),
	('456', 'Tanaka' ,'1979-12-30', 'F'),
	('789', 'Suzuki', '1979-07-07', 'F'),
	('111', 'Sato', '1980-03-12', 'M'),
	('222', 'Takagi', '1979-04-05', 'M'),
	('333', 'Kimura', '1981-03-27', 'F');

