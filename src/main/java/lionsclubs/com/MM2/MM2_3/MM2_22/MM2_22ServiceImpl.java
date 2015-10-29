package lionsclubs.com.MM2.MM2_3.MM2_22;

import java.util.List;

import lionsclubs.com.MM2.MM2_3.MM2_22.MM2_22DAO;
import lionsclubs.com.MM2.MM2_3.MM2_22.MM2_22VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_22ServiceImpl extends AbstractServiceImpl implements MM2_22Service{

	@Autowired
	private MM2_22DAO dao;
	
	@Override
	public List<MM2_22VO_DATA> selectList(MM2_22VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public MM2_22VO_DATA selectSum(MM2_22VO vo) throws Exception {
		return dao.selectSum(vo);
	}
}