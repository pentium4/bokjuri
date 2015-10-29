package lionsclubs.com.MM1.MM1_4.MM1_20;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_20DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_4.MM1_20.";

	/**
	 * 기본정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_20VO> MM1_20(MM1_20VO vo) throws Exception {
		return list(commonId + "MM1_20", vo);
	}

	/**
	 * 경력(선임/위촉)/조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_20VO> appointment(MM1_20VO vo) throws Exception {
		return list(commonId + "appointment", vo);
	}

	/**
	 * 포상
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_20VO> prize(MM1_20VO vo) throws Exception {
		return list(commonId + "prize", vo);
	}

	/**
	 * 교육
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_20VO> education(MM1_20VO vo) throws Exception {
		return list(commonId + "education", vo);
	}
}
