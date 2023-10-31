package kr.co.morae.groupbuy.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.GroupBuyDto;

@Service
public class GroupBuyService {
	@Autowired
	private GroupBuyDao gbDao;
	
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	String fileOrder[] = {"1", "2", "3", "4"};
	String root = "C:/upload/";
	
	@Transactional
	public boolean registerGB(MultipartFile[] files, GroupBuyDto dto){
		int n=0;
		
		dto.setUserId("test1");
		dto.setGbState(GbStateEnum.PROGRESS.getState());
		dto = separateLocation(dto);
		n += gbDao.gbRegister(dto);
		int gbNo = dto.getGbNo();
		
		n += gbDao.gbRegionRegister(dto);
		n += saveFile(files, gbNo);
		
		if(n<(files.length+2)) {
			return false;			
		}
		return true;		
	}
	
	public GroupBuyDto separateLocation(GroupBuyDto dto) {
		String[] totalAddrStrings = dto.getRecruitLocation().split("\n");
		dto.setParcelAddress(totalAddrStrings[1]);
		dto.setPlace(totalAddrStrings[0]);
		log.info(dto.getParcelAddress() + "  " + dto.getPlace());
		
		String[] detailAddr = totalAddrStrings[1].split("\s");
		log.info("length" + detailAddr.length);
		 for(String addr : detailAddr){
             if(addr.endsWith("읍")||addr.endsWith("면")||addr.endsWith("동")){
            	 dto.setGbDetailAddress(addr);
             	break;
             }
         }
		 return dto;
	}
	
	public int saveFile(MultipartFile[] files, int gbNo){
		log.info("gbNo" + gbNo);
		int n = 0;
		if(files!=null || files.length > 0) {
			for(int i=0; i<files.length; i++) {
				String fileName= files[i].getOriginalFilename();
				int extIndex= fileName.lastIndexOf(".");
				String ext = fileName.substring(extIndex);
				int index = Integer.parseInt(fileName.substring(0,1));
				log.info("index : "+ index);
				
				String newFileName = UUID.randomUUID().toString() + fileOrder[index-1]+ext;
				byte[] arr;
				try {
					arr = files[i].getBytes();
					Path path = Paths.get(root+newFileName);
					Files.write(path, arr);
				} catch (IOException e) {
					e.printStackTrace();
				}
				n += gbDao.gbSavePhoto(Integer.toString(gbNo), newFileName);
			}
		}
		return n;
	}
	

}
