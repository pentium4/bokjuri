package lionsclubs.com.MM4.MM4_1.MM4_02;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_02ServiceImpl extends AbstractServiceImpl implements MM4_02Service{
	
	@Autowired
	private MM4_02DAO dao;

	@Override
	public List<MM4_02VO> selectList(MM4_02VO_PARAM vo) throws Exception {
		return (List<MM4_02VO>)dao.selectList(vo);
	}
}
