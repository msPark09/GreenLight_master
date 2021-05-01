package com.gl.master.model.login;

public class LoginVo {
	private String mid;
	private String mpw;
	
	public LoginVo() {
		// TODO Auto-generated constructor stub
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	@Override
	public String toString() {
		return "LoginVo [mid=" + mid + ", mpw=" + mpw + "]";
	}

	public LoginVo(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mid == null) ? 0 : mid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoginVo other = (LoginVo) obj;
		if (mid == null) {
			if (other.mid != null)
				return false;
		} else if (!mid.equals(other.mid))
			return false;
		return true;
	}
	
	
	
}
