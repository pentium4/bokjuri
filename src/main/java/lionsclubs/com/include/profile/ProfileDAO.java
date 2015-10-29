package lionsclubs.com.include.profile;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository
public class ProfileDAO extends EgovAbstractDAO{

	private String commonId = "lionsclubs.com.include.";
	
	/**
	 * 현재 개인기본사항을 가져온다.
	 * @param vo
	 * @return
	 */
	public ProfileVO profile(ProfileVO vo){
		return (ProfileVO)selectByPk(commonId + "profile", vo);
	}

	/**
	 * 이전/다음 memberNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public ProfileVO memberNo(ProfileVO vo) throws Exception {
		return (ProfileVO)selectByPk(commonId + "memberNo", vo);
	}
}
