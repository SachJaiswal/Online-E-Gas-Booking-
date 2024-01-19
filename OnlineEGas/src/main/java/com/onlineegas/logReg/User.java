package com.onlineegas.logReg;

public class User {
	private int userId;
    private String username;
    private String password;
    private String mobile;
    private String email;
    private String address;
    
    public User(String username, String password, String mobile, String email, String address, String aadhaar) {
		super();
		this.username = username;
		this.password = password;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.aadhaar = aadhaar;
	}
	public User(int userId, String username, String password, String mobile, String email, String address,
			String aadhaar) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.aadhaar = aadhaar;
	}
	private String aadhaar;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAadhaar() {
		return aadhaar;
	}
	public void setAadhaar(String aadhaar) {
		this.aadhaar = aadhaar;
	}
}
