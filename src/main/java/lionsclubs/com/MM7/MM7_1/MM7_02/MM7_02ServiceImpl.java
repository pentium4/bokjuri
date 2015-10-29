package lionsclubs.com.MM7.MM7_1.MM7_02;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM7_02ServiceImpl extends AbstractServiceImpl implements MM7_02Service{
	@Autowired private MM7_02DAO dao;

	@Override
	public List<MM7_02VO> MM7_02(MM7_02VO vo) throws Exception {
		return dao.MM7_02(vo);
	}

	@Override
	public MM7_02VO objectDocTemplate(MM7_02VO vo) throws Exception {
		return dao.objectDocTemplate(vo);
	}

	@Override
	public String saveDocTemplate(MM7_02VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String idnNo = vo.getIdnNo();
		if(StringUtils.isNotEmpty(idnNo)){
			dao.updateDocTemplate(vo);
		} else {
			idnNo = dao.insertDocTemplate(vo);
		}
		
		return idnNo;
	}
	
	@Override
	public Integer deleteDocTemplate(MM7_02VO vo) throws Exception {
		return dao.deleteDocTemplate(vo);
	}
}
