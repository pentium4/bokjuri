package lionsclubs.com.MM1.MM1_1.MM1_05;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jfile.service.JFileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_05ServiceImpl extends AbstractServiceImpl implements MM1_05Service{
	
	@Autowired private MM1_05DAO dao;
	@Autowired private JFileService jFileService;		

	@Override
	public Page List(MM1_05VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public MM1_05VO total(MM1_05VO vo) throws Exception {
		return dao.total(vo);
	}

	@Override
	public void Insert(MM1_05VO vo) throws Exception {
		dao.Insert(vo);
	}

	@Override
	public Integer Update(MM1_05VO vo) throws Exception {
		return dao.Update(vo);
	}

	@Override
	public Integer Delete(MM1_05VO vo) throws Exception {
		MM1_05VO detail = dao.Select(vo);
		// 첨부파일을 삭제한다.
		jFileService.removeAttachFiles(detail.getFileId());		
		
		return dao.Delete(vo);
	}

	@Override
	public MM1_05VO Select(MM1_05VO vo) throws Exception {
		return dao.Select(vo);
	}
}
