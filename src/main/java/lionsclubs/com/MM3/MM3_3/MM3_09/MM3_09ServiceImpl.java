package lionsclubs.com.MM3.MM3_3.MM3_09;

import java.util.List;

import lionsclubs.com.MM3.MM3_3.MM3_10.MM3_10VO;
import lionsclubs.com.MM3.MM3_3.MM3_10.MM3_10VO_PARAM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_09ServiceImpl extends AbstractServiceImpl implements MM3_09Service{
	
	@Autowired
	private MM3_09DAO dao;

	@Override
	public List<MM3_09VO> selectList(MM3_09VO vo) throws Exception {
		return (List<MM3_09VO>)dao.selectList(vo);
	}
}
