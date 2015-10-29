package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_01ServiceImpl extends AbstractServiceImpl implements MM6_01Service{
	
	@Autowired
	private MM6_01DAO dao;

	@Override
	public List<MM6_01VO_MEMBER> selectList(MM6_01VO_PARAM vo) throws Exception {
		return (List<MM6_01VO_MEMBER>)dao.selectList(vo);
	}

	@Override
	public MM6_01VO_CLUB_INFO selectClubInfo(MM6_01VO_PARAM vo)
			throws Exception {
		return dao.selectClubInfo(vo);
	}

	@Override
	public List<MM6_01VO_MEMBER> selectClubFourList(MM6_01VO_PARAM vo) throws Exception {
		return (List<MM6_01VO_MEMBER>)dao.selectClubFourList(vo);
	}
}
