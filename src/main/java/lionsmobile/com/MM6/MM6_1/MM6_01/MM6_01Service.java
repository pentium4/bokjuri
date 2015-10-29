package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.util.List;

public interface MM6_01Service {
	public MM6_01VO_CLUB_INFO selectClubInfo(MM6_01VO_PARAM vo) throws Exception;
	public List<MM6_01VO_MEMBER> selectList(MM6_01VO_PARAM vo) throws Exception;
	public List<MM6_01VO_MEMBER> selectClubFourList(MM6_01VO_PARAM vo) throws Exception;
}
