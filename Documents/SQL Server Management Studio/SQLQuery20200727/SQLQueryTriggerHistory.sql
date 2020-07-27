--history�e�[�u����"update","insert"���L�^����g���K�̍쐬
create trigger trgHistoryUpdate on user_B after update
as
begin
	declare @processDate datetime = getdate()
	        , @processAction varchar(10) = 'update'
	;
	insert into history
		(processDate, userId, parameter, processAction)
	select @processDate
		   , ID
		   , loginId
		   , @processAction
	from inserted
	order by ID
	;
end
go
create trigger trgHistoryInsert on user_B after insert
as
begin
	declare @processDate datetime = getdate()
	        , @processAction varchar(10) = 'insert'
	;
	insert into history
		(processDate, userId, parameter, processAction)
	select @processDate
		   , ID
		   , loginId
		   , @processAction
	from inserted
	order by ID
	;
end