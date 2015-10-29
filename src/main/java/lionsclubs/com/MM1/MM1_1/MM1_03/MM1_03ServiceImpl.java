package lionsclubs.com.MM1.MM1_1.MM1_03;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_03ServiceImpl extends AbstractServiceImpl implements MM1_03Service{
	@Autowired private MM1_03DAO dao;

	@Override
	public List<MM1_03VO> List(MM1_03VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public void Insert(MM1_03VO vo) throws Exception {
		vo.setIdnNo(dao.Insert(vo));
		flagUpdate(vo);
	}

	@Override
	public void Update(MM1_03VO vo) throws Exception {
		dao.Update(vo);
		flagUpdate(vo);
	}
	
	@Override
	public void Delete(MM1_03VO vo) throws Exception {
		dao.Delete(vo);
		flagUpdate(vo);
	}
	
	@Override
	public void flagUpdate(MM1_03VO vo) throws Exception {
		if(vo.getAppKindCode() != null){
			if(vo.getAppKindCode().equals("1000")){	// 선임구분(2700) : 선임-클럽임원선임(클럽직책 or 분과소속)
				// 클럽직책 Flag 초기화
				dao.lastClubTitleClear(vo.getMemberNo());
				
				// 최신 클럽직책으로 업데이트
				dao.lastClubTitle(vo.getMemberNo());
				
			} else if(vo.getAppKindCode().equals("1010")){	// 선임구분(2700) : 선임-지구임원선임
				// 지구직책 Flag 초기화
				dao.lastDistrictTitleClear(vo.getMemberNo());
				
				// 최신 지구직책으로 업데이트
				dao.lastDistrictTitle(vo.getMemberNo());
				
			} else if(vo.getAppKindCode().equals("1020")){	// 선임구분(2700) : 선임-복합지구임원선임
				// 복합지구직책 Flag 초기화
				dao.lastComplexTitleClear(vo.getMemberNo());
				
				// 최신 복합지구직책으로 업데이트
				dao.lastComplexTitle(vo.getMemberNo());
				
			} else if(vo.getAppKindCode().equals("1030")){	// 선임구분(2700) : 선임-연합회임원선임
				// 연합회직책 Flag 초기화
				dao.lastAssociationTitleClear(vo.getMemberNo());
				
				// 최신 연합회직책으로 업데이트
				dao.lastAssociationTitle(vo.getMemberNo());
				
			} else if(vo.getAppKindCode().equals("1040")	// 선임구분(2700) : 선임-입회 재입회
					&& (vo.getAppDescCode().equals("1020") || vo.getAppDescCode().equals("1030"))){	// 선임-입회 재입회(2820) : 재입회원(1020), 전입회원(1030)
				// 재입회원, 전입회원 상태 초기화
				dao.lastSingDivisionDateClear(vo.getMemberNo());
				
				// 최신 재입회원, 전입회원 상태로 업데이트
				dao.lastSingDivisionDate(vo.getMemberNo());
				
				if(vo.getAppDescCode().equals("1030")){
					// 전입시 유효한 선임 날짜를 전입날짜로 업데이트
					dao.appDateUpdate(vo);
				}
			} else if(vo.getAppKindCode().equals("1050")){	// 선임구분(2700) : 선임-퇴회
				// 퇴회상태 초기화
				dao.lastQuitDateClear(vo.getMemberNo());
				
				// 최신 퇴회상태로 업데이트
				dao.lastQuitDate(vo.getMemberNo());
				
				// 퇴회시 유효한 선임 날짜를 퇴회날짜로 업데이트
				dao.appDateUpdate(vo); 
			}
		}
		
		// 소속클럽상태 초기화
		dao.lastSectorClubClear(vo.getMemberNo());
		
		// 최신 소속클럽으로 업데이트
		dao.lastSectorClub(vo.getMemberNo());	
	}

	@Override
	public List<MM1_03VO> autoList(Map<String, Object> map)
			throws Exception {
		return dao.autoList(map);
	}

	@Override
	public MM1_03VO Select(MM1_03VO vo) throws Exception {
		return dao.Select(vo);
	}
	
	/**
	 * 최종이력 FLAG(LAST_YN) : Y,N
	 * 선임구분별 FLAG(KIND_FLAG) : 클럽직책 - C, 분과소속 - S, 지구직책 - D, 재입회 - R, 퇴회 - O
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public void flagSchedulingUpdate() throws Exception {
		System.out.println("-----------------------------------------------------------------------");
		System.out.println("-----------------------------------------------------------------------");
		System.out.println("----------------- 선임위촉 이력 FLAG 업데이트 START -------------------");
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		System.out.println("date : " + date);
		
		batchAppointmentUpdate();
			
		System.out.println("-----------------------------------------------------------------------");
		System.out.println("----------------- 선임위촉 이력 FLAG 업데이트 END ---------------------");
		System.out.println("-----------------------------------------------------------------------");
		date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		System.out.println("date : " + date);
	}

	/**
	 * 최신 선임/위촉 flag으로 업데이트
	 * @param memberNo
	 * @throws Exception 
	 */
	public void batchAppointmentUpdate() throws Exception{
		// 선임/위촉 초기화
		dao.batchAppointmentClear();
		
		// 최신 클럽직책으로 업데이트
		dao.batchLastClubTitle();
		
		// 최신 지구직책으로 업데이트
		dao.batchLastDistrictTitle();

		// 최신 복합지구직책으로 업데이트
		dao.batchLastComplexTitle();
		
		// 최신 연합회직책으로 업데이트
		dao.batchLastAssociationTitle();		
		
		// 최신 재입회 상태로 업데이트
		dao.batchLastSingDivisionDate();
		
		// 최신 퇴회상태로 업데이트
		dao.batchLastQuitDate();
		
		// 최신 소속클럽으로 업데이트
		dao.batchLastSectorClub();
	}
	
	/**
	 * 멤버 카운트
	 */
	@Override
	public Integer memberCount(String memberNo) throws Exception {
		return dao.memberCount(memberNo);
	}
	
	/**
	 * 입회 카운트
	 */
	@Override
	public Integer singCount(String memberNo) throws Exception {
		return dao.singCount(memberNo);
	}
	
	/**
	 * 최신 클럽코드
	 */
	@Override
	public MM1_03VO lastStat(MM1_03VO vo) throws Exception {
		return dao.lastStat(vo);
	}
	
	/**
	 * 최신 퇴회일자
	 */
	@Override
	public String lastQuitDateStat(String memberNo) throws Exception {
		return dao.lastQuitDateStat(memberNo);
	}
	
	/**
	 * 퇴회시 유효한 선임 날짜를 퇴회날짜로 업데이트
	 */
	@Override
	public Integer appDateUpdate(MM1_03VO vo) throws Exception {
		return dao.appDateUpdate(vo);
	}
}
