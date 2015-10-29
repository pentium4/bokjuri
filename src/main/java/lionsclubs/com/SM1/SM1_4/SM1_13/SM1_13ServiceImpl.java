package lionsclubs.com.SM1.SM1_4.SM1_13;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_13ServiceImpl extends AbstractServiceImpl implements SM1_13Service{

	@Autowired private SM1_13DAO dao;

	@Override
	public List<SM1_13VO> SM1_13(SM1_13VO vo) throws Exception {
		return dao.SM1_13(vo);
	}
}
