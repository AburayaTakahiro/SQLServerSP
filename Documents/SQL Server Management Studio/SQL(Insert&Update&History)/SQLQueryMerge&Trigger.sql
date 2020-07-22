/* 
 B�e�[�u���Ɏw�肵��LoginId�����݂��Ȃ�������A�e�[�u���Ƀf�[�^���R�s�[,
 ���݂����ꍇ�͏㏑��������merge�̍쐬
*/
merge into users as US
using subusers_01 as SB --insert�m�F�̎���subusers_01,update�m�F�̎���subusers_02
on
	(US.LoginId = SB.LoginId)
when matched then
	update set
		name = SB.name
		, birthday = SB.birthday
		, gender = SB.gender

when not matched then
	insert (loginId, name, birthDay, gender)
	values (SB.loginId, SB.name, SB.birthday, SB.gender)
;

--users�e�[�u���ɍX�V�������L�^��,history�e�[�u����"update"���L�^����g���K�̍쐬
create trigger trgUpdatedDateAndHistoryUpdate on users after update
as
begin
	update users 
		set updatedDate = getdate() 
		where ID = (select ID from inserted)
end
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

--history�e�[�u����"insert"���L�^����g���K�̍쐬
create trigger trgHistoryInsert on users after insert
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