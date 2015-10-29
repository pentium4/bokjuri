package lionsclubs.com.cmm.web.jfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class JfileServiceImpl extends AbstractServiceImpl implements JfileService{

	@Autowired private JfileDAO dao;

	@Override
	public List<JfileVO> jfileList(JfileVO vo) throws Exception {
		return dao.jfileList(vo);
	}
}
