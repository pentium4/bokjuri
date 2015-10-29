package lionsmobile.com.MM6.MM6_1.MM6_07;

import java.util.List;

public interface MM6_07Service {
	/**
	 * 회원 업체조회 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM6_07VO> selectList(MM6_07VO vo) throws Exception;
}
