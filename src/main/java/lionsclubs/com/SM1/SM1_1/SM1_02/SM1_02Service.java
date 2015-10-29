package lionsclubs.com.SM1.SM1_1.SM1_02;

import java.util.List;

import lionsclubs.com.SM1.SM1_1.SM1_02.SM1_02VO;


public interface SM1_02Service {

	public List<SM1_02VO> selectList(SM1_02VO vo) throws Exception;
	public List<SM1_02VO> selectUiAuthList(SM1_02VO vo) throws Exception;
	public List<SM1_02VO> selectOrganList(SM1_02VO vo) throws Exception;
	public void insert(SM1_02VO vo) throws Exception;
	public void delete(SM1_02VO vo) throws Exception;
	public void update(SM1_02VO vo) throws Exception;
	public void updateAuth(SM1_02VO vo) throws Exception;
	public void limitupdate(SM1_02VO vo) throws Exception;
}
