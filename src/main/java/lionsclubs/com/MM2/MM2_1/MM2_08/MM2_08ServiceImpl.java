package lionsclubs.com.MM2.MM2_1.MM2_08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_08ServiceImpl extends AbstractServiceImpl implements MM2_08Service{
	
	@Autowired private MM2_08DAO dao;
	
	@Override
	public List<MM2_08VO> memberList(MM2_08VO vo) throws Exception {
		return dao.memberList(vo);
	}
}
