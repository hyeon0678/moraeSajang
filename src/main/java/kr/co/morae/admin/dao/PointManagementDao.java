package kr.co.morae.admin.dao;

import java.util.ArrayList;

import kr.co.morae.admin.dto.PointManagementDto;

public interface PointManagementDao {

	int totalPage(int i);

	int searchtotalPage(int i, String firstSearchDateValue, String lastSearchDateValue);

	ArrayList<PointManagementDto> adminPointChargeDesc(int i, int offset);

	ArrayList<PointManagementDto> adminPointChargeAsc(int i, int offset);

	ArrayList<PointManagementDto> adminPointChargeSearchDesc(String firstSearchDateValue, String lastSearchDateValue,
			int i, int offset);

	ArrayList<PointManagementDto> adminPointChargeSearchAsc(String firstSearchDateValue, String lastSearchDateValue,
			int i, int offset);

	ArrayList<PointManagementDto> adminPointHistoryDesc(int i, int offset);

	int totalHistoryPage(int i);

}
