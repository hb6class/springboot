package com.hb.sts4x.model.entity;

public class GuestVo {
	private int idx;
	private String sub;
	private String content;
	private int cnt;
	
	public GuestVo() {
	}

	public GuestVo(int idx, String sub, String content, int cnt) {
		super();
		this.idx = idx;
		this.sub = sub;
		this.content = content;
		this.cnt = cnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "GuestVo [idx=" + idx + ", sub=" + sub + ", content=" + content + ", cnt=" + cnt + "]";
	}
	
	
}
