package lionsclubs.com.MM4.MM4_2.MM4_13;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_13ServiceImpl extends AbstractServiceImpl implements MM4_13Service{
	
	@Autowired
	private MM4_13DAO dao;

	@Override
	public List<HashMap<String,Object>> selectData(MM4_13VO_PARAM vo) throws Exception {
		return (List<HashMap<String,Object>>)dao.selectData(vo);
	}

}
