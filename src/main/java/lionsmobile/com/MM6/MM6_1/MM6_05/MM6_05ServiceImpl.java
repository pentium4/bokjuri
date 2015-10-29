package lionsmobile.com.MM6.MM6_1.MM6_05;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_05ServiceImpl extends AbstractServiceImpl implements MM6_05Service{
	
	@Autowired
	private MM6_05DAO dao;

	@Override
	public List<MM6_05VO_MEMBER> selectClubChairManList(MM6_05VO_PARAM vo) throws Exception {
		return (List<MM6_05VO_MEMBER>)dao.selectClubChairManList(vo);
	}
}
