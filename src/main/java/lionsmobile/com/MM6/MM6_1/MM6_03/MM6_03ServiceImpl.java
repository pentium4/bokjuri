package lionsmobile.com.MM6.MM6_1.MM6_03;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_03ServiceImpl extends AbstractServiceImpl implements MM6_03Service{
	
	@Autowired
	private MM6_03DAO dao;

	@Override
	public List<MM6_03VO_MENU> selectMenuList(MM6_03VO_PARAM vo) throws Exception {
		return (List<MM6_03VO_MENU>)dao.selectMenuList(vo);
	}

	@Override
	public List<MM6_03VO_MEMBER> selectMemberList(MM6_03VO_PARAM vo) throws Exception {
		return (List<MM6_03VO_MEMBER>)dao.selectMemberList(vo);
	}
}
