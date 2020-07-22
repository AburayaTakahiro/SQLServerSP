--user�e�[�u���̍쐬
create table users (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
	, createdDate datetime default getdate()
	, updatedDate datetime 
);

--subusers_01�e�[�u���̍쐬(insert�m�F�p�j
create table subusers_01 (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
);

--subusers_02�e�[�u���̍쐬(update�m�F�p)
create table subusers_02 (
	ID int not null identity(1,1) primary key
	, loginId varchar(50) null
	, name varchar(50) null
	, birthday date null
	, gender char(1) null
);

--�����e�[�u���̍쐬
create table history (
	ID int not null identity(1,1) primary key
	, processDate datetime 
	, userId varchar(50) not null
	, parameter varchar(50) not null
	, processAction varchar(10) not null
);

--users�e�[�u���Ƀf�[�^�̑}��
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

--subusers_01�e�[�u���Ƀf�[�^�}��(insert�m�F�p�j
insert into subusers_01
	(loginId, name, birthday, gender)
values
	('123', 'Yoshida', '1990-02-22', 'M')
;

--subusers_02�e�[�u���Ƀf�[�^�}��(update�m�F�p)
insert into subusers_02
	(loginId, name, birthday, gender)
values
	('256', 'Adachi', '1994-05-09', 'F')
;