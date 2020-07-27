--テーブルAの作成
create table user_A (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
);

--テーブルBの作成
create table user_B (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
	, createdDate datetime default getdate()
	, updatedDate datetime 
);

--Aテーブルにデータの挿入
insert into user_A
	(loginId, name, birthday, gender)
values
	('123', 'Yamada', '1980-02-15', 'M')
	, ('456', 'Tanaka' ,'1979-12-30', 'F')
	, ('789', 'Suzuki', '1979-07-07', 'F')
	, ('111', 'Sato', '1980-03-12', 'M')
	, ('222', 'Takagi', '1979-04-05', 'M')
	, ('333', 'Kimura', '1981-03-27', 'F')
;

--Bテーブルにデータ挿入(insert確認用）
insert into user_B
	(loginId, name, birthday, gender)
values
	('123', 'Yoshida', '1990-02-22', 'M')
;

--履歴テーブルの作成
create table history (
	ID int not null identity(1,1) primary key
	, processDate datetime 
	, userId varchar(50) not null
	, parameter varchar(50) not null
	, processAction varchar(10) not null
);
