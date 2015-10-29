package lionsclubs.com.MM3.MM3_1.MM3_04;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_04ServiceImpl extends AbstractServiceImpl implements MM3_04Service{
	
	@Autowired
	private MM3_04DAO dao;

	/**
	 * 조회
	 */	
	@Override
	public List<MM3_04VO> selectList(MM3_04VO vo) throws Exception {
		if("d".equals(vo.getChkbox_dstTitleOrClubTitle())){
			return (List<MM3_04VO>)dao.selectList(vo);	
		}else{
			return (List<MM3_04VO>)dao.selectList2(vo);
		}
	}
}
