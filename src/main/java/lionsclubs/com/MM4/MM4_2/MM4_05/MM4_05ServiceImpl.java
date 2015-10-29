package lionsclubs.com.MM4.MM4_2.MM4_05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_05ServiceImpl extends AbstractServiceImpl implements MM4_05Service{
	
	@Autowired
	private MM4_05DAO dao;
	@Override
	public List<MM4_05VO> selectList(MM4_05VO_PARAM vo) throws Exception {
		return (List<MM4_05VO>)dao.selectList(vo);
	}
}
