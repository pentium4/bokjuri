package lionsclubs.com.scheduling;

import javax.annotation.Resource;

import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03Service;
import lionsclubs.com.notice.NoticeService;

import org.springframework.stereotype.Service;


@Service
public class Scheduling {
	@Resource private SchedulingService service;
	@Resource private MM1_03Service mm103Service;
	@Resource private NoticeService notiservice;
	
	/**
	 * 최종이력 FLAG(LAST_YN) : Y,N
	 * 선임구분별 FLAG(KIND_FLAG) : 클럽직책 - C, 분과소속 - S, 지구직책 - D, 재입회 - R, 퇴회 - O 
	 * @throws Exception
	 */
	public void flagSchedulingUpdate() throws Exception {
		mm103Service.flagSchedulingUpdate();
	}	
	
	/**
	 * 6개월이 지난 공개자료는 삭제한다.
	 * @throws Exception
	 */
	public void deleteNoticeScheduling() throws Exception {
		notiservice.deleteNoticeScheduling();
	}
	
	/**
	 * 사용하지 않는 첨푸파일을 삭제한다.
	 * @throws Exception
	 */
	public void listDeleteFileId() throws Exception {
		service.listDeleteFileId();
	}
}
