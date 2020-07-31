--x“X’è‹`ƒe[ƒuƒ‹‚Ìì¬
create table branchList (
	  branchCode char(5) not null primary key
	, branchName nvarchar(50) not null
);

--x“X‚²‚Æ”„ãƒe[ƒuƒ‹‚Ìì¬
create table branchSales (
	  ID int not null identity(1,1) primary key
	, branchCode char(5) not null
	, sales	decimal(20,0) not null
);

--”„ãWŒvƒe[ƒuƒ‹‚Ìì¬
create table totalSales (
	branchCode char(5) not null primary key
	, sumOfSales decimal(20,0) not null
);

--x“X’è‹`ƒe[ƒuƒ‹‚Éƒf[ƒ^‚ğ‘}“ü
insert into branchList
	(branchCode, branchName)
values 
	  ('001', 'D–yx“X')
	, ('002', 'å‘äx“X')
	, ('003', '“Œ‹x“X')
	, ('004', '–¼ŒÃ‰®x“X')
	, ('005', '‘åãx“X')
	, ('006', '•Ÿ‰ªx“X')
;

--x“X‚²‚Æ‚Ì”„ãƒe[ƒuƒ‹‚Éƒf[ƒ^‚ğ‘}“ü
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
