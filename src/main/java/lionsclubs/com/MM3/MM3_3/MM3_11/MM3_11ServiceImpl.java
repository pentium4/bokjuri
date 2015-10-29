package lionsclubs.com.MM3.MM3_3.MM3_11;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_11ServiceImpl extends AbstractServiceImpl implements MM3_11Service{
	
	@Autowired
	private MM3_11DAO dao;

	@Override
	public HashMap<String,Object> selectList(MM3_11VO vo) throws Exception {
		HashMap<String,Object> result = new HashMap<String,Object>();
		HashMap<String,Object> sumData = new HashMap<String,Object>();
		
		List<MM3_11VO> list = dao.selectList(vo);
		
		/* 
		 * 2014-10-28 : 평균 추가
		 * 
		 */
		float avgSum = 0;
		for(int i = 0; i < list.size() ; i++){
			MM3_11VO data = list.get(i);			
			avgSum = avgSum + data.getAvg();			
		}
		avgSum = avgSum / (float)list.size();
		
		sumData.put("AVG", (float)avgSum);
		sumData.put("result", list);
		
		return sumData;
	}
}
