package kr.co.morae.groupbuy.dto;

public class SearchOptionDto {
	private String category;
	private String keyWord;
	private String region;
	private int pageNum;
	private int offset;
	
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	@Override
	public String toString() {
		String s = "";
		s += "pageNum:"+pageNum+", categoryType:" +category+", keyWord:"+keyWord+", region:"+region;
		return s;
	}
	
	
	
	

}
