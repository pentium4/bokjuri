package lionsmobile.com.MM6.MM6_1.MM6_07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_07ServiceImpl extends AbstractServiceImpl implements MM6_07Service{
	
	@Autowired
	private MM6_07DAO dao;

	@Override
	public List<MM6_07VO> selectList(MM6_07VO vo) throws Exception {
		return dao.selectList(vo);
	}
}
