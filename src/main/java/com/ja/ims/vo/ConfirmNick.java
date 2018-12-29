package com.ja.ims.vo;

public class ConfirmNick {
	private boolean isConfirmNick;
	
	public ConfirmNick() {
		
	}

	public ConfirmNick(boolean isConfirmNick) {
		super();
		this.isConfirmNick = isConfirmNick;
	}

	public boolean isConfirmNick() {
		return isConfirmNick;
	}

	public void setConfirmNick(boolean isConfirmNick) {
		this.isConfirmNick = isConfirmNick;
	}

	@Override
	public String toString() {
		return "ConfirmNick [isConfirmNick=" + isConfirmNick + "]";
	}

	
	}
