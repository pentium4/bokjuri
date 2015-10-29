package lionsclubs.com.MM4.MM4_2.MM4_10;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_10ServiceImpl extends AbstractServiceImpl implements MM4_10Service{
	
	@Autowired
	private MM4_10DAO dao;

	@Override
	public List<MM4_10VO> selectList(MM4_10VO_PARAM vo) throws Exception {
		return (List<MM4_10VO>)dao.selectList(vo);
	}

	@Override
	public List<MM4_10VO_ORG> selectOrgList(MM4_10VO_PARAM vo) throws Exception {
		return (List<MM4_10VO_ORG>)dao.selectOrgList(vo);
	}
}
