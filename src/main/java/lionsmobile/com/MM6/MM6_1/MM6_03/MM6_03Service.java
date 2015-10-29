package lionsmobile.com.MM6.MM6_1.MM6_03;

import java.util.List;

public interface MM6_03Service {
	public List<MM6_03VO_MENU> selectMenuList(MM6_03VO_PARAM vo) throws Exception;

	public List<MM6_03VO_MEMBER> selectMemberList(MM6_03VO_PARAM vo) throws Exception;
}
