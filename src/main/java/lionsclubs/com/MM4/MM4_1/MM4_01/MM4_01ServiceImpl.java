package lionsclubs.com.MM4.MM4_1.MM4_01;

import java.util.List;

import lionsclubs.com.MM3.MM3_1.MM3_01.MM3_01VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_01ServiceImpl extends AbstractServiceImpl implements MM4_01Service{
	
	@Autowired private MM4_01DAO dao;
	
	@Override
	public MM4_01VO basicInfo(MM4_01VO vo) throws Exception {
		return dao.basicInfo(vo);
	}
	
	@Override
	public List<MM4_01VO> complexList(MM4_01VO vo) throws Exception {
		return dao.complexList(vo);
	}
	
	@Override
	public List<MM3_01VO> officerChangeHistoryList(MM4_01VO vo)
			throws Exception {
		return dao.officerChangeHistoryList(vo);
	}
}
