-- 게시판 목록
select bl.bcode, c.cname, bl.bname, bl.btype, c.ccode,
       decode(bl.btype, 5, 'reboard',
						6, 'album',
						7, 'bbs',
						'board') control 
from board_list bl, category c
where bl.ccode = c.ccode;

-- 답변게시판 글쓰기
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode)
	values(?, ?, ?, ?, ?, ?, 0, sysdate, ?)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_rseq.nextval, ?, ?, 0, 0, 0, 0)
select * from dual;

-- 게시글 얻어오기
select 	b.seq, b.id, b.name, b.email, b.subject, 
		b.content, b.hit, b.logtime, b.bcode,
		r.rseq, r.ref, r.lev, r.step, r.pseq, r.reply 
from board b, reboard r
where b.seq = r.seq
and b.seq = ?;

-- 게시판 리스트(목록)
-- 3페이지의 목록 출력. >> 41 - 60
-- 조건
-- 3번게시판
-- 20건/1페이지
-- 오늘쓴글   12:34:54
-- 오늘쓴글 x 17.06.13
select b.*
from (
	select rownum rn, a.*
	from (
		select 	b.seq, b.id, b.name, b.email, b.subject, 
				b.content, b.hit, b.bcode,
				decode(to_char(logtime, 'yymmdd'), 
							to_char(sysdate, 'yymmdd'), to_char(logtime, 'hh24:mi:ss'), 
							to_char(logtime, 'yy.mm.dd')) logtime,
				r.rseq, r.ref, r.lev, r.step, r.pseq, r.reply 
		from board b, reboard r
		where b.seq = r.seq
		and b.bcode = ?
		order by b.seq desc
		) a
	where rownum <= ?
	) b
where b.rn > ?

-- 새글수
SELECT COUNT(seq)
FROM BOARD
where BCODE = 3
and to_char(LOGTIME, 'yymmdd') = to_char(sysdate, 'yymmdd');

-- 전체글수
SELECT COUNT(seq)
FROM BOARD
where BCODE = 3;

---- 인서트 ----
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode)
	values (board_seq.nextval, 'rion', 'lion', 'fdkal', 'fjdkal', 'fdfd', 0, sysdate, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_rseq.nextval, 3, 1, 0, 0, 0, 0)
select * from dual;


----- 메인 페이지 평점에 따른 게스트 하우스 리스트 뿌리기 ----
select *
from (
	select rownum r, s.*
	from 
		(
		select *
		from store
		order by evaluation desc, storeseq desc
		) s
	) sa, guesthouse g
where
	sa.storeseq = g.storeseq and
	sa.r <= 6
order by r
;







