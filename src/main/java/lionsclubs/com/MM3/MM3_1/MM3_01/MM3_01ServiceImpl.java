package lionsclubs.com.MM3.MM3_1.MM3_01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_01ServiceImpl extends AbstractServiceImpl implements MM3_01Service{
	
	@Autowired private MM3_01DAO dao;
	
	@Override
	public MM3_01VO basicInfo(MM3_01VO vo) throws Exception {
		return dao.basicInfo(vo);
	}
	
	@Override
	public List<MM3_01VO> officerChangeHistoryList(MM3_01VO vo) throws Exception {
		return dao.officerChangeHistoryList(vo);
	}
	
	@Override
	public List<MM3_01VO> districtMemberList(MM3_01VO vo) throws Exception {
		return dao.districtMemberList(vo);
	}
}
