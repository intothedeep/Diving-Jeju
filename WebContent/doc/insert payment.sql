select payment_seq from dual;

insert 
into payment (payseq, paycontent, totalprice, payreceived, payleft, paytype, paysourceseq)
values (#{paySeq}, #{payContent}, #{totalPrice}, #{payReceived}, #{payLeft}, #{payType}, #{paySourceSeq});
