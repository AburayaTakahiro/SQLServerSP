--売上集計テーブルにinsertの動作確認
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '005'
	, @errorMessage output
;
print @errorMessage
;

--エラーメッセージの動作確認1
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '007'
	, @errorMessage output
;
print @errorMessage
;

--エラーメッセージの動作確認2
declare @errorMessage nvarchar(100)
;
exec uspSumOfSale
	  '006'
	, @errorMessage output
;
print @errorMessage
;