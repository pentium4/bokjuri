package lionsclubs.com.MM3.MM3_1.MM3_05;

import java.util.List;

import lionsclubs.com.MM3.MM3_3.MM3_09.MM3_09VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_05ServiceImpl extends AbstractServiceImpl implements MM3_05Service{
	
	@Autowired
	private MM3_05DAO dao;

	@Override
	public List<MM3_05VO> selectList(MM3_05VO vo) throws Exception {
		return (List<MM3_05VO>)dao.selectList(vo);
	}
}
