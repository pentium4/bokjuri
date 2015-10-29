package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

public interface MM3_25Service {

	public List<MM3_25VO> mList(MM3_25VO vo) throws Exception;
	
	public MM3_25VO SelectEvent(MM3_25VO vo) throws Exception;
	
	public void mInsert(MM3_25VO vo) throws Exception;
	
	public Integer mUpdate(MM3_25VO vo) throws Exception;
	
	public Integer mDelete(MM3_25VO vo) throws Exception;
	
	public List<MM3_25VO> dList(MM3_25VO vo) throws Exception;
	
	public MM3_25HeadVO HeadList(MM3_25HeadVO vo) throws Exception;

	public MM3_25VO Select(MM3_25VO vo) throws Exception;
	
	public void clubSave(MM3_25VO vo) throws Exception;
	
	
}
