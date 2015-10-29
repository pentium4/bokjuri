package lionsclubs.com.SM1.SM1_2.SM1_05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_05ServiceImpl extends AbstractServiceImpl implements SM1_05Service{

	@Autowired private SM1_05DAO dao;

	@Override
	public List<SM1_05VO> organHistoryList(SM1_05VO vo) throws Exception {
		return dao.organHistoryList(vo);
	}
}
