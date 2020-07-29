--����W�v�e�[�u���Ɏw�肵���x�X�̑�����グ��}������sp�̍쐬
create procedure uspSumOfSale
	  @branchCode char(5)
	, @errorMessage nvarchar(100) out
as
begin
	--�w�肵���x�X�R�[�h���x�X��`�e�[�u���ɑ��݂��邩�ǂ����̊m�F
	if not exists
		(select * from branchList
		 where branchcode = @branchCode)
		begin
			set @errorMessage = N'�w�肵���x�X�����݂��܂���'
			;
		end
	--�w�肵���x�X�R�[�h���x�X���Ƃ̔���e�[�u���ɑ��݂��邩�ǂ����̊m�F
	else if exists
		(select * from branchSales
		 where branchCode = @branchCode)
		begin
			insert into totalSales
				(branchCode, sumOfSales)
			select branchCode, sum(sales) 
			from branchSales
			where branchCode = @branchCode
			group by branchCode
		end
	else

		begin
			set @errorMessage = N'�w�肵���x�X�̔��オ���݂��܂���';
		end
end
;