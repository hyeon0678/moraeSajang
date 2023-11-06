package kr.co.morae.listener;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;

@Component 
class GbStateConfirmListener implements ApplicationListener<ContextRefreshedEvent>, DisposableBean {

	Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	GroupBuyDao gbDao;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		log.info("===gbStateComfirmListener start");
		Thread thread = new Thread(()->{
			while(true) {
				try {
					log.info("thread test");
					log.info("do thread");
					
					LocalDate currentDate = LocalDate.now();
					LocalDateTime nextDate = currentDate.atStartOfDay();
			        long currMillisconds = nextDate.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
			        
					//공구 완료 == 완료 날짜
					ArrayList<GbStateCheckDto> gbStateList = gbDao.checkGbState();
					log.info(gbStateList.toString());
					
					if(gbStateList.size()>0) {
						autoSettingGbState(gbStateList, currMillisconds);
					}
					
					long sleep = getTimeSleep();
					
					Thread.sleep(sleep);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});
		
		thread.start();
		
	}
	
	private long getTimeSleep() {
		long curMilliseconds = System.currentTimeMillis();
		LocalDate currentDate = LocalDate.now();
        
		LocalDateTime nextDate = currentDate.atStartOfDay().plusDays(1).plusMinutes(5);
        long nextMillisconds = nextDate.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long sleep = nextMillisconds-curMilliseconds;
        log.info("현재 날짜: " + currentDate);
        log.info("내일 날짜: " + nextDate);
        log.info("내일 날짜: " + sleep);
        return sleep;
	}
	
	/*
	 * 공구 상태 자동 확인함수
	 * 1. 공구 모집 마감날짜 >= 현재 날짜 && 모집 인원 != 참여 인원 -> 공구 상태를 취소로 바꾼다
	 * 2. 공구 완료 날짜 <= 현재 날짜 -> 공구 상태를 완료로 바꾼다
	 * 3. 공구 모집 인원 == 공구 완료 인원 -> 공구 상태를 완료로 바꾼다
	 */
	private synchronized void autoSettingGbState(ArrayList<GbStateCheckDto> gbStateList, long currMillisconds) {
		
		for(GbStateCheckDto dto : gbStateList) {
			
			if((dto.getFinishDate().getTime() <= currMillisconds)
					&&dto.getRecruitPeople() != dto.getJoinNum()) {
				
				gbDao.modifyGbState(dto.getGbNo(), GbStateEnum.CANCEL.getState());
			
			}else if((dto.getCompleteDate().getTime() <= currMillisconds) || (dto.getCompleteCnt() == dto.getRecruitPeople())) {
				gbDao.modifyGbState(dto.getGbNo(), GbStateEnum.COMPLETE.getState());
			
			}
		}
	}
	
	@Override
	public void destroy() throws Exception {
		log.info("====== distroy thread ==========");
		Thread.interrupted();
	}
	
	
}
