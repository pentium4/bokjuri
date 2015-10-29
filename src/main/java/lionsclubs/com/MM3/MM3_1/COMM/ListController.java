package lionsclubs.com.MM3.MM3_1.COMM;

import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.MM3.MM3_1.COMM.LIST_VO;
import lionsclubs.com.MM3.MM3_1.COMM.ListService;

public class ListController {
	@Resource private ListService service;

	protected List<LIST_VO_DATA> selectList(LIST_VO vo) throws Exception {
 		return this.initList(service.selectList(vo), 6);
	}
	
	private List<LIST_VO_DATA>initList(List<LIST_VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() > 0) {
			int idx = resultList.size() % size;
			
			for(int i = idx; i < size; i++) {
				resultList.add(new LIST_VO_DATA());
			}
		}
		return resultList;
	}
}
