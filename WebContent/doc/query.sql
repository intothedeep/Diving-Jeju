-- �Խ��� ���
select bl.bcode, c.cname, bl.bname, bl.btype, c.ccode,
       decode(bl.btype, 5, 'reboard',
						6, 'album',
						7, 'bbs',
						'board') control 
from board_list bl, category c
where bl.ccode = c.ccode;

-- �亯�Խ��� �۾���
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode)
	values(?, ?, ?, ?, ?, ?, 0, sysdate, ?)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_rseq.nextval, ?, ?, 0, 0, 0, 0)
select * from dual;

-- �Խñ� ������
select 	b.seq, b.id, b.name, b.email, b.subject, 
		b.content, b.hit, b.logtime, b.bcode,
		r.rseq, r.ref, r.lev, r.step, r.pseq, r.reply 
from board b, reboard r
where b.seq = r.seq
and b.seq = ?;

-- �Խ��� ����Ʈ(���)
-- 3�������� ��� ���. >> 41 - 60
-- ����
-- 3���Խ���
-- 20��/1������
-- ���þ���   12:34:54
-- ���þ��� x 17.06.13
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

-- ���ۼ�
SELECT COUNT(seq)
FROM BOARD
where BCODE = 3
and to_char(LOGTIME, 'yymmdd') = to_char(sysdate, 'yymmdd');

-- ��ü�ۼ�
SELECT COUNT(seq)
FROM BOARD
where BCODE = 3;

---- �μ�Ʈ ----
insert all
	into board (seq, name, id, email, subject, content, hit, logtime, bcode)
	values (board_seq.nextval, 'rion', 'lion', 'fdkal', 'fjdkal', 'fdfd', 0, sysdate, 0)
	into reboard (rseq, seq, ref, lev, step, pseq, reply)
	values (reboard_rseq.nextval, 3, 1, 0, 0, 0, 0)
select * from dual;


----- ���� ������ ������ ���� �Խ�Ʈ �Ͽ콺 ����Ʈ �Ѹ��� ----
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







