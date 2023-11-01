package kr.co.morae.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.admin.dto.ReportManagementDto;

public interface ReportManagementDao {

	ArrayList<HashMap<String, Object>> list(int pagenum, int pages);

	int num(String pageState);

	ArrayList<ReportManagementDto> listall(int offset);

	int allnum();

	ArrayList<ReportManagementDto> liststate(String pageState, int offset);

	int statenum(String pageState);

	

	

}
