package lionsclubs.com.SM1.SM1_2.SM1_05;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_05DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_05.";
	
	/**
	 * 조직코드 이력조회
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_05VO> organHistoryList(SM1_05VO vo) throws Exception {
		return list(commonId + "organHistoryList", vo);
	}
	
	/**
	 * 조직코드 이력 마지막 Flag 초기화
	 * @return
	 * @throws Exception
	 */
	public Integer organHistoryLastFlagClear() throws Exception {
		return update(commonId + "organHistoryLastFlagClear", null);
	}

	/**
	 * 조직코드 이력 마지막 Flag 업데이트
	 * @return
	 * @throws Exception
	 */
	public Integer updateOrganHistoryLastFlag() throws Exception {
		return update(commonId + "updateOrganHistoryLastFlag", null);
	}
}
