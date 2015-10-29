package lionsmobile.com.MM6.MM6_1.MM6_04;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_04ServiceImpl extends AbstractServiceImpl implements MM6_04Service{
	
	@Autowired
	private MM6_04DAO dao;

	@Override
	public List<MM6_04VO_MENU> selectMenuList(MM6_04VO_PARAM vo) throws Exception {
		return (List<MM6_04VO_MENU>)dao.selectMenuList(vo);
	}

	@Override
	public List<MM6_04VO_MEMBER> selectMemberList(MM6_04VO_PARAM vo) throws Exception {
		return (List<MM6_04VO_MEMBER>)dao.selectMemberList(vo);
	}
}
