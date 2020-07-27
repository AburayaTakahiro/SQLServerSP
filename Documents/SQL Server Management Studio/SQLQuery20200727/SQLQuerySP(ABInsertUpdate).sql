/*
 B�e�[�u���Ɏw�肵��LoginId�����݂��Ȃ�������AA�e�[�u���̃f�[�^��B�e�[�u���ɃR�s�[�A
 B�e�[�u���Ɏw�肵��LoginId�����݂����ꍇ�AA�e�[�u���̃f�[�^��B�e�[�u���ɏ㏑������SP�̍쐬
*/
create procedure uspUserInsertUpdate
	@loginId varchar(50)
as
begin
	if exists
		(select * from user_B
		 where loginId = @loginId)
	begin
		update user_B
		set
			user_B.name = user_A.name
			, user_B.birthday = user_A.birthday
			, user_B.gender = user_A.gender
			, user_B.updatedDate = getdate()
		from
			user_B
		inner join
			user_A
		on
			user_A.loginId = user_B.loginId
	end
	else
	begin
		insert into user_B (loginId, name, birthday, gender)
		select loginId, name, birthday, gender
		from user_A
		where loginId = @loginId
	end
end
;
