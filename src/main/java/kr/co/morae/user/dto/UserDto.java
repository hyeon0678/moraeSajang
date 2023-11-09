package kr.co.morae.user.dto;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import kr.co.morae.admin.dto.AuthDto;

public class UserDto {
	
	private String userId;
	private int hintNo;
	private String password;
	private String email;
	private String nickname;
	private String hintAnswer;
	private String name;
	private Date reg_date;
	private int age;
	private String gender;
	// 사용자 주소 필드 (통 주소)
		private String addr;
	// 사용자 주소 필드
	private String streetAddress;
	private String userDetailAddress;
	private String detailAddress;
	

	// 사용자 권한 필드
	private Integer authNo;
	private String authType;
	private String state;
	
	
	
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getHintNo() {
		return hintNo;
	}
	public void setHintNo(int hintNo) {
		this.hintNo = hintNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHintAnswer() {
		return hintAnswer;
	}
	public void setHintAnswer(String hintAnswer) {
		this.hintAnswer = hintAnswer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getUserDetailAddress() {
		return userDetailAddress;
	}
	public void setUserDetailAddress(String userDetailAddress) {
		this.userDetailAddress = userDetailAddress;
	}
	public Integer getAuthNo() {
		return authNo;
	}
	public void setAuthNo(Integer authNo) {
		this.authNo = authNo;
	}
	public String getAuthType() {
		return authType;
	}
	public void setAuthType(String authType) {
		this.authType = authType;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
