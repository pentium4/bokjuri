package lionsclubs.com.MM3.MM3_3.MM3_10;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_10ServiceImpl extends AbstractServiceImpl implements MM3_10Service{
	
	@Autowired
	private MM3_10DAO dao;
	@Override
	public List<MM3_10VO> selectList(MM3_10VO_PARAM vo) throws Exception {
		return (List<MM3_10VO>)dao.selectList(vo);
	}
}
