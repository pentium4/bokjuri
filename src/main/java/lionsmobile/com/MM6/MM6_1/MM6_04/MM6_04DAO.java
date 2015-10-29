package lionsmobile.com.MM6.MM6_1.MM6_04;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM6_04DAO extends LionsAbstractDAO{
	private String commonId = "lionsmobile.com.MM6.MM6_1.MM6_04.";
	
	@SuppressWarnings("unchecked")
	public List<MM6_04VO_MENU> selectMenuList(MM6_04VO_PARAM vo) {
		return (List<MM6_04VO_MENU>)list(commonId + "selectMenuList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM6_04VO_MEMBER> selectMemberList(MM6_04VO_PARAM vo) {
		return (List<MM6_04VO_MEMBER>)list(commonId + "selectMemberList", vo);
	}
}
