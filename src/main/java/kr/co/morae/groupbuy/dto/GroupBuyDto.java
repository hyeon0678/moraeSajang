package kr.co.morae.groupbuy.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;
//글 작성 dto
public class GroupBuyDto {
	private int gbNo;
	private String recruitLocation;
	private String categoryType;
	private String userId;
	private String nickName;
	private int categoryNo;
	private String gbContent;
	private String title;
	private int recruitPeople;
	private Date finishDate;
	private Date startDate;
	private int joinPrice;
	private String gbState;
	private String blockState;
	private String parcelAddress;
	private String gbDetailAddress;
	private String place;

	
	public String getRecruitLocation() {
		return recruitLocation;
	}
	public void setRecruitLocation(String recruitLocation) {
		this.recruitLocation = recruitLocation;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getGbContent() {
		return gbContent;
	}
	public void setGbContent(String gbContent) {
		this.gbContent = gbContent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRecruitPeople() {
		return recruitPeople;
	}
	public void setRecruitPeople(int recruitPeople) {
		this.recruitPeople = recruitPeople;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getJoinPrice() {
		return joinPrice;
	}
	public void setJoinPrice(int joinPrice) {
		this.joinPrice = joinPrice;
	}
	public String getGbState() {
		return gbState;
	}
	public void setGbState(String gbState) {
		this.gbState = gbState;
	}
	public String getBlockState() {
		return blockState;
	}
	public void setBlockState(String blockState) {
		this.blockState = blockState;
	}
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getParcelAddress() {
		return parcelAddress;
	}
	public void setParcelAddress(String parcelAddress) {
		this.parcelAddress = parcelAddress;
	}
	public String getGbDetailAddress() {
		return gbDetailAddress;
	}
	public void setGbDetailAddress(String gbDetailAddress) {
		this.gbDetailAddress = gbDetailAddress;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		String s = "gbDetailAddress="+gbDetailAddress+", parcelAddress="+parcelAddress+", gbContent="+gbContent;
	           s += ", joinPrice="+joinPrice+", finishDate="+finishDate+", place="+place+", categoryType="+categoryType;
	           s += ", title="+title+", recruitPeople="+recruitPeople+", startDate="+startDate;
	           s +=  ", gbNo : " +gbNo+", userId : " +userId+"recruitLocation="+recruitLocation;
		return s;
	}

}
