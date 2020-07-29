--売上集計テーブルに指定した支店の総売り上げを挿入するspの作成
create procedure uspSumOfSale
	  @branchCode char(5)
	, @errorMessage nvarchar(100) out
as
begin
	--指定した支店コードが支店定義テーブルに存在するかどうかの確認
	if not exists
		(select * from branchList
		 where branchcode = @branchCode)
		begin
			set @errorMessage = N'指定した支店が存在しません'
			;
		end
	--指定した支店コードが支店ごとの売上テーブルに存在するかどうかの確認
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
			set @errorMessage = N'指定した支店の売上が存在しません';
		end
end
;