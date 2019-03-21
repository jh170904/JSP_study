package com.naver;

public class NaverDTO {
	private String id;
	private String name;
	private String nickname;
	private String pwd1;
	private String ans; 
	private String qnasel;
	private String selfq;
	private String email1;
	private String email2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String chksosik;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd1() {
		return pwd1;
	}
	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getQnasel() {
		return qnasel;
	}
	public void setQnasel(String qnasel) {
		this.qnasel = qnasel;
	}
	public String getSelfq() {
		return selfq;
	}
	public void setSelfq(String selfq) {
		this.selfq = selfq;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
		if(email1==null){
			this.email1="";
		}
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
		if(email2==null){
			this.email2="";
		}
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
		if(phone1==null){
			this.phone1 = "";
		}
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
		if(phone2==null){
			this.phone2 = "";
		}
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
		if(phone3==null){
			this.phone3 = "";
		}
	}
	public String getChksosik() {
		return chksosik;
	}
	public void setChksosik(String chksosik) {
		this.chksosik = chksosik;
		if(chksosik==null){
			this.chksosik = "no";
		}else{
			this.chksosik = "yes";
		}
	}


}
