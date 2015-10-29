package lionsclubs.com.SM1.SM1_1.SM1_02_A;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_02_AServiceImpl extends AbstractServiceImpl implements SM1_02_AService{

	@Autowired
	private SM1_02_ADAO dao;
	
	@Override
	public Page selectList(SM1_02_AVO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public Page memerSearchList(SM1_02_AVO vo) throws Exception {
		return dao.memerSearchList(vo);
	}
	
	@Override
	public void insert(SM1_02_AVO vo) throws Exception {
		System.out.println("vo.getMoreAuthArray() : " + vo.getMoreAuthArray());
		for(SM1_02_AVO ivo : vo.getMoreAuthArray()){
			ivo.setInsertName(vo.getInsertName());
			ivo.setUpdateName(vo.getUpdateName());
			dao.insert(ivo);
		}
	}
	
	@Override
	public void delete(SM1_02_AVO vo) throws Exception {
		for(SM1_02_AVO dvo : vo.getMoreAuthArray()){
			dao.delete(dvo);
		}
	}
}

