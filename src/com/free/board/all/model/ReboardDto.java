package com.free.board.all.model;

import com.free.board.admin.model.BoardDto;

public class ReboardDto extends BoardDto {
	private int rseq;
	private int ref;//그룹번호
	private int lev;//들여쓰기
	private int step;//답변 정렬순서
	private int pseq;//원글번호 parent seq
	private int reply;//답변갯수
	
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	
	
}
