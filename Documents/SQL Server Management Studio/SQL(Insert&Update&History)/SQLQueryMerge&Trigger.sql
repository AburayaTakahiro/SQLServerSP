/* 
 Bテーブルに指定したLoginIdが存在しなかったらAテーブルにデータをコピー,
 存在した場合は上書きをするmergeの作成
*/
merge into users as US
using subusers_01 as SB --insert確認の時はsubusers_01,update確認の時はsubusers_02
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

--usersテーブルに更新日時を記録と,historyテーブルに"update"を記録するトリガの作成
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

--historyテーブルに"insert"を記録するトリガの作成
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