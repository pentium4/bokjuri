package lionsclubs.com.MM4.MM4_2.MM4_06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_06ServiceImpl extends AbstractServiceImpl implements MM4_06Service{
	
	@Autowired
	private MM4_06DAO dao;
	@Override
	public List<MM4_06VO> selectList(MM4_06VO_PARAM vo) throws Exception {
		return (List<MM4_06VO>)dao.selectList(vo);
	}
}
