package lionsclubs.com.MM3.MM3_3.MM3_12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_12ServiceImpl extends AbstractServiceImpl implements MM3_12Service{
	
	@Autowired
	private MM3_12DAO dao;

	@Override
	public List<MM3_12VO> selectList(MM3_12VO vo) throws Exception {
		return (List<MM3_12VO>)dao.selectList(vo);
	}
}
