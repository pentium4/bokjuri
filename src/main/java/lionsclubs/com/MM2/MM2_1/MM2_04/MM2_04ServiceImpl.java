package lionsclubs.com.MM2.MM2_1.MM2_04;

import java.util.List;

import lionsclubs.com.MM2.MM2_1.MM2_04.MM2_04VO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_04ServiceImpl extends AbstractServiceImpl implements MM2_04Service{
	
	@Autowired
	private MM2_04DAO dao;
	

	@Override
	public MM2_04VO MM2_04(MM2_04VO vo) throws Exception {
		return dao.MM2_04(vo);
	}
	
	@Override
	public List<MM2_04VO> List(MM2_04VO vo) throws Exception {
		return dao.List(vo);
	}
}
