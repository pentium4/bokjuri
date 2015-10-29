package lionsmobile.com.MM6.MM6_1.MM6_08;

import java.util.List;

public interface MM6_08Service {
	/**
	 * 개인 납부금 현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM6_08VO> listServicePersonal(MM6_08VO vo) throws Exception;

	/**
	 * 개인 납부금 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM6_08VO sumServicePersonal(MM6_08VO vo) throws Exception;
	
	/**
	 * 지구 약정금 / 임원분담금
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM6_08VO> listServiceCommitmentOfficer(MM6_08VO vo) throws Exception;
	
}
