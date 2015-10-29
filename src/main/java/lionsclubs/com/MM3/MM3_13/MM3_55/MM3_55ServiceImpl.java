package lionsclubs.com.MM3.MM3_13.MM3_55;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_55ServiceImpl extends AbstractServiceImpl implements MM3_55Service{
	@Autowired private MM3_55DAO dao;
	
	@Override
	public MM3_55VO MM3_55(MM3_55VO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getMemberNo())){
			vo.setMemberNo(dao.initMemberNo(vo));
		}
		
		return dao.MM3_55(vo);
	}
	
	@Override
	public MM3_55VO memberNo(MM3_55VO vo) throws Exception {
		return dao.memberNo(vo);
	}
	
	@Override
	public List<MM3_55VO> listRepOrgan(MM3_55VO vo) throws Exception {
		return dao.listRepOrgan(vo);
	}
	
	@Override
	public MM3_55VO objectRepOrgan(MM3_55VO vo) throws Exception {
		return dao.objectRepOrgan(vo);
	}
	
	@Override
	public String saveRepOrgan(MM3_55VO vo) throws Exception {
		String message = saveRepOrganProcess(vo);
		String sMessage = null;
   
    	/*
	    	오류 메세지 정보
	    	message = "1";	// 처리 완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	private String saveRepOrganProcess(MM3_55VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateRepOrgan(vo);
		} else {
			dao.insertRepOrgan(vo);
		}
		
		return "1";
	}
	
	@Override
	public Integer deleteRepOrgan(MM3_55VO vo) throws Exception {
		return dao.deleteRepOrgan(vo);
	}
}
