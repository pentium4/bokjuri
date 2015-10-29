package lionsclubs.com.MM3.MM3_4.MM3_23;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_23ServiceImpl extends AbstractServiceImpl implements MM3_23Service{
	@Autowired private MM3_23DAO dao;

	@Override
	public java.util.List<MM3_23VO> List(MM3_23VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());
		
		return dao.List(vo);
	}
}
