--売上集計テーブルに指定した支店の総売り上げを挿入するspの作成
create procedure uspSumOfSales
	  @retCode int output
as
begin
	--[変数宣言]
	declare @cntRecord int
	;
	declare @branchCode char(5)
	;
	declare @sales decimal(20,0)
	;
	--[カーソル宣言]
	declare curSumOfSales cursor local for
		select branchCode, sales
		from branchSales
	;
	--[更新処理]
	begin transaction
	begin try
		--カーソルオープン
		open curSumOfSales
		--最初の行の値を格納
		fetch next from curSumOfSales
		into @branchCode, @sales
		;
		--@@fetch_status = 0 : 行が存在するときはループをする
		while @@fetch_status = 0
		begin
			--支店定義テーブルに支店コードが存在するかどうか
			if exists
				(select * from branchList
				 where branchCode = @branchCode)
				begin
					--売上集計テーブルにすでに支店コードが存在する場合
					if exists
						(select * from totalSales
						 where branchCode = @branchCode)
						 update totalSales
						 set sumOfSales += @sales
						 where branchCode = @branchCode
				--売上集計テーブルに支店コードが存在しない場合
					else
						insert into totalSales
							(branchCode, sumOfSales)
						values
							(@branchCode, @sales)
				end
				;
			--更新レコード数取得
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
					--エラーの場合ロールバックして終了
					rollback transaction
					;
					--カーソル処理の終了
					close curSumOfSales
					;
					deallocate surSumOfSales
					;
					return
					;
				end
				;
			--次の行の値を格納
			fetch next from curSumOfsales
			into @branchCode, @sales
			;
		end
		;
	end try
	begin catch
		set @retCode = 1
		;
		--エラーの場合ロールバックして終了
		rollback transaction
		;
		--カーソル処理の終了
		close curSumOfsales
		;
		deallocate curSumOfSales
		;
		return
		;
	end catch
	;
	--[終了処理]
	close curSumOfSales
	;
	deallocate curSumOfSales
	;
	if @retCode = 0
		--成功時の処理
		begin
			--全て成功ならコミット
			commit transaction
			;
		end
		;
	else
		begin
			set @retCode = 1
			;
			--エラーの場合ロールバックして終了
			rollback transaction
			;
			return
			;
		end
		;
end
;