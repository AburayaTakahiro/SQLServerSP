--userテーブルの作成
create table users (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
	, createdDate datetime default getdate()
	, updatedDate datetime 
);

--subusers_01テーブルの作成(insert確認用）
create table subusers_01 (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
);

--subusers_02テーブルの作成(update確認用)
create table subusers_02 (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
);

--履歴テーブルの作成
create table history (
	ID int not null identity(1,1) primary key
	, processDate datetime 
	, userId varchar(50) not null
	, parameter varchar(50) not null
	, processAction varchar(10) not null
);

--usersテーブルにデータの挿入
insert into users
	(loginId, name, birthday, gender)
values
	('123', 'Yamada', '1980-02-15', 'M')
	, ('456', 'Tanaka' ,'1979-12-30', 'F')
	, ('789', 'Suzuki', '1979-07-07', 'F')
	, ('111', 'Sato', '1980-03-12', 'M')
	, ('222', 'Takagi', '1979-04-05', 'M')
	, ('333', 'Kimura', '1981-03-27', 'F')
;

--subusers_01テーブルにデータ挿入(insert確認用）
insert into subusers_01
	(loginId, name, birthday, gender)
values
	('123', 'Yoshida', '1990-02-22', 'M')
;

--subusers_02テーブルにデータ挿入(update確認用)
insert into subusers_02
	(loginId, name, birthday, gender)
values
	('256', 'Adachi', '1994-05-09', 'F')
;