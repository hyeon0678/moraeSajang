package kr.co.morae.groupbuy.dto;

import java.sql.Date;

public class CommentDto {
	private String gbNo;
	private String commNo;
	private String userId;
	private String nickname;
	private String comment;
	private String commState;
	private boolean isCommentWriter;
	private Date regDate;
	
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGbNo() {
		return gbNo;
	}
	public void setGbNo(String gbNo) {
		this.gbNo = gbNo;
	}
	public String getCommNo() {
		return commNo;
	}
	public void setCommNo(String commNo) {
		this.commNo = commNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommState() {
		return commState;
	}
	public void setCommState(String commState) {
		this.commState = commState;
	}
	public boolean getIsCommentWriter() {
		return isCommentWriter;
	}
	public void setCommentWriter(boolean isCommentWriter) {
		this.isCommentWriter = isCommentWriter;
	}
	
	
	

}
