package kr.co.morae.admin.dto;

import java.sql.Date;

public class ReportManagementDto {

	private int reportNo;
	private String reportId;
	private String reportContent;
	private Date reportRegDate;
	private String reportType;
	private int uniqueNo;
	private String processState;
	
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportRegDate() {
		return reportRegDate;
	}
	public void setReportRegDate(Date reportRegDate) {
		this.reportRegDate = reportRegDate;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public int getUniqueNo() {
		return uniqueNo;
	}
	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}
	public String getProcessState() {
		return processState;
	}
	public void setProcessState(String processState) {
		this.processState = processState;
	}
	
	
	
	
	
	
	
	
	
}
