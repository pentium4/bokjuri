package lionsclubs.com.MM2.MM2_1.MM2_01;

import java.util.List;

import lionsclubs.com.MM2.MM2_1.MM2_01.MM2_01VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_01ServiceImpl extends AbstractServiceImpl implements MM2_01Service{
	
	@Autowired private MM2_01DAO dao;

	@Override
	public MM2_01VO basicInfo(MM2_01VO vo) throws Exception {
		
		return dao.basicInfo(vo);
	}
	@Override
	public Integer selectMM2_01TotalCount(MM2_01VO vo) throws Exception {
		
		return dao.selectMM2_01TotalCount(vo);
	}
	
	@Override
	public List<MM2_01VO> officerChangeHistoryList(MM2_01VO vo) throws Exception {
		return dao.officerChangeHistoryList(vo);
	}

	@Override
	public List<MM2_01VO> clubHistory(MM2_01VO vo) throws Exception {
		return dao.clubHistory(vo);
	}

	@Override
	public List<MM2_01VO> clubOrgan(MM2_01VO vo) throws Exception {
		return dao.clubOrgan(vo);
	}
	
	@Override
	public List<MM2_01VO> clubCross(MM2_01VO vo) throws Exception {
		return dao.clubCross(vo);
	}
}
