package lionsclubs.com.cmm.commoncode;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class CommonCodeServiceImpl extends AbstractServiceImpl implements CommonCodeService{

	@Autowired
	private CommonCodeDAO dao;
	
	@Override
	public List<CommonCodeVO> codelist(String groupCode) throws Exception {
		return dao.codelist(groupCode);
	}
	
	@Override
	public List<CommonCodeVO> codelistSimple(String groupCode) throws Exception {
		return dao.codelistSimple(groupCode,"","");
	}
	
	@Override
	public String codetolabel(CommonCodeVO vo) throws Exception {
		return dao.codetolabel(vo);
	}
	
	@Override
	public String codetocode1(CommonCodeVO vo) throws Exception {
		return dao.codetocode1(vo);
	}
	
	@Override
	public List<CommonCodeVO> codeOption1List(CommonCodeVO vo) throws Exception {
		return dao.codeOption1List(vo);
	}

	@Override
	public List<CommonCodeVO> codelistSimple(String groupCode,String code1,String code2) throws Exception {
		return dao.codelistSimple(groupCode,code1,code2);
	}
	
	@Override
	public List<CommonCodeVO> codeOption2List(CommonCodeVO vo) throws Exception {
		vo.setCode1s(vo.getCode1().split(","));
		return dao.codeOption2List(vo);
	}
	
	@Override
	public String organCodeToName(CommonCodeVO vo) throws Exception {
		return dao.organCodeToName(vo);
	}
}
