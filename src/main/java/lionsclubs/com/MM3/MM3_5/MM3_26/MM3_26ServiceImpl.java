package lionsclubs.com.MM3.MM3_5.MM3_26;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import java.util.List;

@Service
public class MM3_26ServiceImpl extends AbstractServiceImpl implements MM3_26Service{
	
	@Autowired
	private MM3_26DAO dao;

	@Override
	public List<MM3_26VO> List(MM3_26VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.List(vo);
	}
}
