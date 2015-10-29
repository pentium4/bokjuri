package lionsclubs.com.MM1.MM1_1.MM1_07;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_07ServiceImpl extends AbstractServiceImpl implements MM1_07Service{
	@Autowired private MM1_07DAO dao;

	@Override
	public List<MM1_07VO> List(MM1_07VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public List<MM1_07VO> ListEvent(MM1_07VO vo) throws Exception {
		return dao.ListEvent(vo);
	}

	@Override
	public void Insert(MM1_07VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		for(MM1_07VO event : vo.getEventArray()){
			event.setInsertName(user.getName());
			event.setUpdateName(user.getName());
			
			dao.Insert(event);	
		}
	}
	
	@Override
	public void Update(MM1_07VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		for(MM1_07VO event : vo.getEventArray()){
			event.setInsertName(user.getName());
			event.setUpdateName(user.getName());
			
			dao.Update(event);	
		}
	}
}
