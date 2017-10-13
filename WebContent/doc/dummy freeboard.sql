select board_seq.nextval from dual;        
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, 'lion', 'lion', 'admin@admin.com', '라이언은 누구를 좋아하나?', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 1, 0, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_seq.nextval, board_seq.currval, board_seq.currval, 0, 0, 0, 0)
select * from dual   ;

select board_seq.nextval from dual;        
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, '임택', '임택', 'admin@admin.com', 'wake me up!', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 0, sysdate, 1, 0, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_seq.nextval, board_seq.currval, board_seq.currval, 0, 0, 0, 0)
select * from dual;

select board_seq.nextval from dual;        
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, 'chainsmoker', 'chainsmoker', 'admin@admin.com', 'something just like you', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 100, sysdate, 1, 3, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_seq.nextval, board_seq.currval, board_seq.currval, 0, 0, 0, 0)
select * from dual    ;


select board_seq.nextval from dual;        
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode, up, down)
	values(board_seq.currval, 'wow', 'wow', 'admin@admin.com', '이건 hot list test 용', '라이언은 흠흠흠.흠흠흠. <br> 이니이니이니 <br> 정말? <br> ㅠㅠ', 777, sysdate, 1, 51, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_seq.nextval, board_seq.currval, board_seq.currval, 0, 0, 0, 0)
select * from dual    ;