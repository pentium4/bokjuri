package lionsclubs.com.MM2.MM2_2.MM2_13;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_13ServiceImpl extends AbstractServiceImpl implements MM2_13Service{
	
	@Autowired
	private MM2_13DAO dao;
	
	@Override
	public MM2_13VO MM2_13(MM2_13VO vo) throws Exception {
		return dao.MM2_13(vo);
	}
	
	@Override
	public MM2_13HeadVO HeadList(MM2_13HeadVO vo) throws Exception {
		return dao.HeadList(vo);
	}
	
	@Override
	public MM2_13HeadVO codeInfo(MM2_13HeadVO vo) throws Exception {
		return dao.codeInfo(vo);
	}
	
	@Override
	public List<MM2_13VO> List(MM2_13VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void otherIncomeInsert(MM2_13VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		dao.otherIncomeInsert(vo);
	}
	
	@Override
	public Integer otherIncomeUpdate(MM2_13VO vo) throws Exception {
		return dao.otherIncomeUpdate(vo);
	}

	@Override
	public Integer otherIncomeDelete(MM2_13VO vo) throws Exception {
		return dao.otherIncomeDelete(vo);
	}

	@Override
	public void calculateInsert(MM2_13VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		dao.calculateInsert(vo);
	}
	
	@Override
	public MM2_13VO calculateSearch(MM2_13VO vo) throws Exception {
		return dao.calculateSearch(vo);
	}

	@Override
	public MM2_13VO paymentSum(MM2_13VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	@Override
	public MM2_13VO paymentDate(MM2_13VO vo) throws Exception {
		return dao.paymentDate(vo);
	}
}
