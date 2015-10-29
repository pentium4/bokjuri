package lionsclubs.com.MM2.MM2_3.MM2_21;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_21ServiceImpl extends AbstractServiceImpl implements MM2_21Service{
	@Autowired private MM2_21DAO dao;
	@Resource private MM2_17Service mm217Service;

	@Override
	public List<MM2_21VO_DATA> selectList(MM2_21VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public MM2_21VO_DATA selectListSum(MM2_21VO vo) throws Exception {
		return dao.selectListSum(vo);
	}
}
