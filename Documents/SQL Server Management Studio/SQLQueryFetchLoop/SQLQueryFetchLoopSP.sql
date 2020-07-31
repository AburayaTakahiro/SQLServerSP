--����W�v�e�[�u���Ɏw�肵���x�X�̑�����グ��}������sp�̍쐬
create procedure uspSumOfSales
	  @retCode int output
as
begin
	--[�ϐ��錾]
	declare @cntRecord int
	;
	declare @branchCode char(5)
	;
	declare @sales decimal(20,0)
	;
	--[�J�[�\���錾]
	declare curSumOfSales cursor local for
		select branchCode, sales
		from branchSales
	;
	--[�X�V����]
	begin transaction
	begin try
		--�J�[�\���I�[�v��
		open curSumOfSales
		--�ŏ��̍s�̒l���i�[
		fetch next from curSumOfSales
		into @branchCode, @sales
		;
		--@@fetch_status = 0 : �s�����݂���Ƃ��̓��[�v������
		while @@fetch_status = 0
		begin
			--�x�X��`�e�[�u���Ɏx�X�R�[�h�����݂��邩�ǂ���
			if exists
				(select * from branchList
				 where branchCode = @branchCode)
				begin
					--����W�v�e�[�u���ɂ��łɎx�X�R�[�h�����݂���ꍇ
					if exists
						(select * from totalSales
						 where branchCode = @branchCode)
						 update totalSales
						 set sumOfSales += @sales
						 where branchCode = @branchCode
				--����W�v�e�[�u���Ɏx�X�R�[�h�����݂��Ȃ��ꍇ
					else
						insert into totalSales
							(branchCode, sumOfSales)
						values
							(@branchCode, @sales)
				end
				;
			--�X�V���R�[�h���擾
			set @cntRecord = @@ROWCOUNT
			;
			if @cntRecord = 1
				begin
					set @retCode = 0
					;
				end
				;
			else
				begin
					set @retCode = 1
					;
					--�G���[�̏ꍇ���[���o�b�N���ďI��
					rollback transaction
					;
					--�J�[�\�������̏I��
					close curSumOfSales
					;
					deallocate surSumOfSales
					;
					return
					;
				end
				;
			--���̍s�̒l���i�[
			fetch next from curSumOfsales
			into @branchCode, @sales
			;
		end
		;
	end try
	begin catch
		set @retCode = 1
		;
		--�G���[�̏ꍇ���[���o�b�N���ďI��
		rollback transaction
		;
		--�J�[�\�������̏I��
		close curSumOfsales
		;
		deallocate curSumOfSales
		;
		return
		;
	end catch
	;
	--[�I������]
	close curSumOfSales
	;
	deallocate curSumOfSales
	;
	if @retCode = 0
		--�������̏���
		begin
			--�S�Đ����Ȃ�R�~�b�g
			commit transaction
			;
		end
		;
	else
		begin
			set @retCode = 1
			;
			--�G���[�̏ꍇ���[���o�b�N���ďI��
			rollback transaction
			;
			return
			;
		end
		;
end
;