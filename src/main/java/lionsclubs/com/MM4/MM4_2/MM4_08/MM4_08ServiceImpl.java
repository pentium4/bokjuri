package lionsclubs.com.MM4.MM4_2.MM4_08;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_08ServiceImpl extends AbstractServiceImpl implements MM4_08Service{
	
	@Autowired
	private MM4_08DAO dao;

	@Override
	public List<MM4_08VO_PARAM> selectList(MM4_08VO_PARAM vo) throws Exception {
		return (List<MM4_08VO_PARAM>)dao.selectList(vo);
	}

}
