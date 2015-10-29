package lionsmobile.com.MM6.MM6_1.MM6_08;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM6_08DAO extends LionsAbstractDAO{
	private String commonId = "lionsmobile.com.MM6.MM6_1.MM6_08.";
	
	/**
	 * 개인 납부금 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM6_08VO> listServicePersonal(MM6_08VO vo) throws Exception {
		return list(commonId + "listServicePersonal", vo);
	}

	/**
	 * 개인 납부금 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM6_08VO sumServicePersonal(MM6_08VO vo) throws Exception {
		return (MM6_08VO) selectByPk(commonId + "sumServicePersonal", vo);
	}

	/**
	 * 지구 약정금 / 임원분담금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM6_08VO> listServiceCommitmentOfficer(MM6_08VO vo) throws Exception {
		return list(commonId + "listServiceCommitmentOfficer", vo);
	}
}
