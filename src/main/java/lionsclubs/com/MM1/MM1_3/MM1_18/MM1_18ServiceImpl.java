package lionsclubs.com.MM1.MM1_3.MM1_18;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_18ServiceImpl extends AbstractServiceImpl implements MM1_18Service{

	@Autowired private MM1_18DAO dao;

	@Override
	public MM1_18VO countNotTreatment(MM1_18VO vo) throws Exception {
		return dao.countNotTreatment(vo);
	}
}
