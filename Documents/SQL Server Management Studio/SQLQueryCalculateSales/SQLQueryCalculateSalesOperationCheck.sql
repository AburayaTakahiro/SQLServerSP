--����W�v�e�[�u����insert�̓���m�F
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '005'
	, @errorMessage output
;
print @errorMessage
;

--�G���[���b�Z�[�W�̓���m�F1
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '007'
	, @errorMessage output
;
print @errorMessage
;

--�G���[���b�Z�[�W�̓���m�F2
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '006'
	, @errorMessage output
;
print @errorMessage
;