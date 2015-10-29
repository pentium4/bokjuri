package lionsclubs.com.MM4.MM4_2.MM4_11;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_11ServiceImpl extends AbstractServiceImpl implements MM4_11Service{
	
	@Autowired
	private MM4_11DAO dao;

	@Override
	public List<MM4_11VO> selectList(MM4_11VO_PARAM vo) throws Exception {
		return (List<MM4_11VO>)dao.selectList(vo);
	}
}
