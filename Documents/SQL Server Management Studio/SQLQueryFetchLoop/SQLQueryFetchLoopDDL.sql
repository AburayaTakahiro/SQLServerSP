--�x�X��`�e�[�u���̍쐬
create table branchList (
	  branchCode char(5) not null primary key
	, branchName nvarchar(50) not null
);

--�x�X���Ɣ���e�[�u���̍쐬
create table branchSales (
	  ID int not null identity(1,1) primary key
	, branchCode char(5) not null
	, sales	decimal(20,0) not null
);

--����W�v�e�[�u���̍쐬
create table totalSales (
	branchCode char(5) not null primary key
	, sumOfSales decimal(20,0) not null
);

--�x�X��`�e�[�u���Ƀf�[�^��}��
insert into branchList
	(branchCode, branchName)
values 
	  ('001', '�D�y�x�X')
	, ('002', '���x�X')
	, ('003', '�����x�X')
	, ('004', '���É��x�X')
	, ('005', '���x�X')
	, ('006', '�����x�X')
;

--�x�X���Ƃ̔���e�[�u���Ƀf�[�^��}��
insert into branchSales	
	(branchCode, sales)
values
     ('001', 60000)
	,('001', 58000)
	,('002', 80000)
	,('003', 70000)
	,('003', 29000)
	,('004', 68000)
	,('005', 96000)
	,('005', 45000)
	,('005', 87000)
	,('0007', 73000)
;
