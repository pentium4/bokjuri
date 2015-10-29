package lionsclubs.com.MM1.MM1_1.MM1_03;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_03DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_03.";
	
	/**
	 * 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_03VO> List(MM1_03VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM1_03VO Select(MM1_03VO vo) throws Exception {
		return (MM1_03VO)selectByPk(commonId + "Select", vo);
    }
	
	public String Insert(MM1_03VO vo) throws Exception {
		return (String)insert(commonId + "Insert", vo);
    }
	
	public Integer Update(MM1_03VO vo) throws Exception {
		return update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM1_03VO vo) throws Exception {
		return delete(commonId + "Delete", vo);
    }
	
	/**
	 * autocomplete 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_03VO> autoList(Map<String, Object> map) throws Exception {
		return list(commonId + "autoList", map);
	} 
	
	/**
	 * 최종이력 FLAG(LAST_YN) : Y,N
	 * 선임구분별 FLAG(KIND_FLAG) : 클럽직책 - C, 분과소속 - S, 지구직책 - D, 재입회 - R, 퇴회 - O
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void flagUpdate(MM1_03VO vo) throws Exception {
		update(commonId + "Update", vo);
	}
	
	/**
	 * 경력(선임/위촉) 멤버 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<String> memberNoList() throws Exception {
		return list(commonId + "memberNoList", null);
	}
	
	/**
	 * 클럽직책 Flag 초기화 
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastClubTitleClear(String memberNo) throws Exception {
		return update(commonId + "lastClubTitleClear", memberNo);
	}

	/**
	 * 분과소속 Flag 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastDivisionSectorClear(String memberNo) throws Exception {
		return update(commonId + "lastDivisionSectorClear", memberNo);
	}

	/**
	 * 지구직책 Flag 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastDistrictTitleClear(String memberNo) throws Exception {
		return update(commonId + "lastDistrictTitleClear", memberNo);
	}

	/**
	 * 복합지구직책 Flag 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastComplexTitleClear(String memberNo) throws Exception {
		return update(commonId + "lastComplexTitleClear", memberNo);
	}

	/**
	 * 연합회직책 Flag 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastAssociationTitleClear(String memberNo) throws Exception {
		return update(commonId + "lastAssociationTitleClear", memberNo);
	}

	/**
	 * 재입회 상태 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastSingDivisionDateClear(String memberNo) throws Exception {
		return update(commonId + "lastSingDivisionDateClear", memberNo);
	}

	/**
	 * 퇴회상태 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastQuitDateClear(String memberNo) throws Exception {
		return update(commonId + "lastQuitDateClear", memberNo);
	}

	/**
	 * 소속클럽상태 초기화
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastSectorClubClear(String memberNo) throws Exception {
		return update(commonId + "lastSectorClubClear", memberNo);
	}
	
	/**
	 * 최신 클럽직책으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastClubTitle(String memberNo) throws Exception {
		return update(commonId + "lastClubTitle", memberNo);
	}

	/**
	 * 최신 분과소속으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastDivisionSector(String memberNo) throws Exception {
		return update(commonId + "lastDivisionSector", memberNo);
	}

	/**
	 * 최신 지구직책으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastDistrictTitle(String memberNo) throws Exception {
		return update(commonId + "lastDistrictTitle", memberNo);
	}
	
	/**
	 * 최신 복합지구직책으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastComplexTitle(String memberNo) throws Exception {
		return update(commonId + "lastComplexTitle", memberNo);
	}

	/**
	 * 최신 연합회직책으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastAssociationTitle(String memberNo) throws Exception {
		return update(commonId + "lastAssociationTitle", memberNo);
	}
	
	/**
	 * 최신 재입회원 상태로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastSingDivisionDate(String memberNo) throws Exception {
		return update(commonId + "lastSingDivisionDate", memberNo);
	}

	/**
	 * 최신 퇴회상태로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastQuitDate(String memberNo) throws Exception {
		return update(commonId + "lastQuitDate", memberNo);
	}

	/**
	 * 최신 소속클럽으로 업데이트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer lastSectorClub(String memberNo) throws Exception {
		return update(commonId + "lastSectorClub", memberNo);
	}	
	
	/**
	 * 멤버 카운트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer memberCount(String memberNo) throws Exception {
		return (Integer) selectByPk(commonId + "memberCount", memberNo);
	}
	
	/**
	 * 입회 카운트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer singCount(String memberNo) throws Exception {
		return (Integer) selectByPk(commonId + "singCount", memberNo);
	}
	
	/**
	 * 최신클럽코드
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public MM1_03VO lastStat(MM1_03VO vo) throws Exception {
		return (MM1_03VO) selectByPk(commonId + "lastStat", vo);
	}
	
	/**
	 * 최신퇴회일자
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public String lastQuitDateStat(String memberNo) throws Exception {
		return (String) selectByPk(commonId + "lastQuitDateStat", memberNo);
	}

	/**
	 * 퇴회또는 전입시 유효한 선임 날짜를 퇴회날짜로 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer appDateUpdate(MM1_03VO vo) throws Exception {
		return update(commonId + "appDateUpdate", vo);
	}
	
	/**
	 * 선임/위촉 전체 초기화
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer batchAppointmentClear() throws Exception {
		return update(commonId + "batchAppointmentClear", null);
	}
	
	/**
	 * 최신 클럽직책으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastClubTitle() throws Exception {
		return update(commonId + "batchLastClubTitle", null);
	}

	/**
	 * 최신 분과소속으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastDivisionSector() throws Exception {
		return update(commonId + "batchLastDivisionSector", null);
	}

	/**
	 * 최신 지구직책으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastDistrictTitle() throws Exception {
		return update(commonId + "batchLastDistrictTitle", null);
	}
	
	/**
	 * 최신 복합지구직책으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastComplexTitle() throws Exception {
		return update(commonId + "batchLastComplexTitle", null);
	}

	/**
	 * 최신 연합회직책으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastAssociationTitle() throws Exception {
		return update(commonId + "batchLastAssociationTitle", null);
	}
	
	/**
	 * 최신 재입회원 상태로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastSingDivisionDate() throws Exception {
		return update(commonId + "batchLastSingDivisionDate", null);
	}

	/**
	 * 최신 퇴회상태로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastQuitDate() throws Exception {
		return update(commonId + "batchLastQuitDate", null);
	}

	/**
	 * 최신 소속클럽으로 업데이트 - 배치
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer batchLastSectorClub() throws Exception {
		return update(commonId + "batchLastSectorClub", null);
	}	
}
