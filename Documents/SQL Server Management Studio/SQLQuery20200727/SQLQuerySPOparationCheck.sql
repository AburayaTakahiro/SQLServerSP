--logoinIDがBテーブルに存在する時のsp動作確認(update)
exec uspUserInsertUpdate
	'123'
;

--ogoinIDがBテーブルに存在しない時のspの動作確認(insert)
exec uspUserInsertUpdate
	'456'
;