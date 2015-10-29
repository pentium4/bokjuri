package lionsclubs.com.MM3.MM3_5.MM3_28;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_28ServiceImpl extends AbstractServiceImpl implements MM3_28Service{
	
	@Autowired
	private MM3_28DAO dao;

	@Override
	public List<MM3_28VO_DATA> selectList(MM3_28VO_PARAM vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public Integer mergeData(MM3_28VO_DATA vo) throws Exception {
		
		vo.setInputFirst(vo.getInputFirst().replace(".", ""));
		vo.setInputSecond(vo.getInputSecond().replace(".", ""));
		vo.setInputThird(vo.getInputThird().replace(".", ""));
		vo.setInputFourth(vo.getInputFourth().replace(".", ""));
		vo.setInputFifth(vo.getInputFifth().replace(".", ""));
		vo.setInputSixth(vo.getInputSixth().replace(".", ""));
		vo.setInputSeventh(vo.getInputSeventh().replace(".", ""));
		vo.setInputEighth(vo.getInputEighth().replace(".", ""));
		vo.setInputNineth(vo.getInputNineth().replace(".", ""));
		vo.setInputTenth(vo.getInputTenth().replace(".", ""));
		vo.setInputEleventh(vo.getInputEleventh().replace(".", ""));
		vo.setInputTwelveth(vo.getInputTwelveth().replace(".", ""));
		
		return dao.mergeData(vo);
	}


}
