package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM6_01DAO extends LionsAbstractDAO{
	private String commonId = "lionsmobile.com.MM6.MM6_1.MM6_01.";
	
	@SuppressWarnings("unchecked")
	public List<MM6_01VO_MEMBER> selectList(MM6_01VO_PARAM vo) {
		return (List<MM6_01VO_MEMBER>)list(commonId + "selectList", vo);
	}
	
	public MM6_01VO_CLUB_INFO selectClubInfo(MM6_01VO_PARAM vo) {
		return (MM6_01VO_CLUB_INFO)super.selectByPk(commonId + "selectClubInfo", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM6_01VO_MEMBER> selectClubFourList(MM6_01VO_PARAM vo) {
		return (List<MM6_01VO_MEMBER>)list(commonId + "selectClubFourList", vo);
	}
}
