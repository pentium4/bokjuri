package lionsmobile.com.MM6.MM6_1.MM6_04;

import java.util.List;

public interface MM6_04Service {
	public List<MM6_04VO_MENU> selectMenuList(MM6_04VO_PARAM vo) throws Exception;

	public List<MM6_04VO_MEMBER> selectMemberList(MM6_04VO_PARAM vo) throws Exception;
}
