package lionsmobile.com.MM6.MM6_1.MM6_05;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM6_05DAO extends LionsAbstractDAO{
	private String commonId = "lionsmobile.com.MM6.MM6_1.MM6_05.";
	
	@SuppressWarnings("unchecked")
	public List<MM6_05VO_MEMBER> selectList(MM6_05VO_PARAM vo) {
		return (List<MM6_05VO_MEMBER>)list(commonId + "selectList", vo);
	}
	
	public MM6_05VO_CLUB_INFO selectClubInfo(MM6_05VO_PARAM vo) {
		return (MM6_05VO_CLUB_INFO)super.selectByPk(commonId + "selectClubInfo", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM6_05VO_MEMBER> selectClubChairManList(MM6_05VO_PARAM vo) {
		return (List<MM6_05VO_MEMBER>)list(commonId + "selectClubChairManList", vo);
	}
}
