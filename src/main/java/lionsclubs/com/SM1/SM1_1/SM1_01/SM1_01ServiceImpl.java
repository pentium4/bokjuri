package lionsclubs.com.SM1.SM1_1.SM1_01;

import java.util.List;
import lionsclubs.com.SM1.SM1_1.SM1_01.SM1_01VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_01ServiceImpl extends AbstractServiceImpl implements SM1_01Service{

	@Autowired
	private SM1_01DAO dao;

	@Override
	public List<SM1_01VO> selectList(SM1_01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<SM1_01VO>)dao.selectList(vo);
	}

	@Override
	public Integer selectListTotalCount(SM1_01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListTotalCount(vo);
	}

	
	
	
}
