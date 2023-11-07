package kr.co.morae.admin.dao;

import java.util.ArrayList;

import kr.co.morae.admin.dto.CategoryAnalysisDto;
import kr.co.morae.admin.dto.RegionAnalysisDto;

public interface AnalysisDao {

	ArrayList<RegionAnalysisDto> adminanalysisAdress(String dfirstSearchDate, String dlastSearchDate);

	ArrayList<CategoryAnalysisDto> categorydraw();



}
