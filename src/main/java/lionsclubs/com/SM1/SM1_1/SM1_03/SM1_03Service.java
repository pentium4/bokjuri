package lionsclubs.com.SM1.SM1_1.SM1_03;

import java.util.List;

public interface SM1_03Service {

	public List<SM1_03VO> authGroupList(SM1_03VO vo) throws Exception;		/* 권한그룹 */
	public List<SM1_03VO> organAuthList(SM1_03VO vo) throws Exception;		/* 조직권한 부여 */
	public List<SM1_03VO> organUiAuthList(SM1_03VO vo) throws Exception;	/* 화면권한 부여 */
	public SM1_03VO SelectData(SM1_03VO vo) throws Exception;
	
	public void insert(SM1_03VO vo) throws Exception;
	public void update(SM1_03VO vo) throws Exception;
	public void delete(SM1_03VO vo) throws Exception;
	
	public void updateUiAuth(SM1_03VO vo) throws Exception;
	
	/**
	 * 추가권한 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_03VO objectMoreAuthManage(SM1_03VO vo) throws Exception;
	
	/**
	 * 추가권한 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean saveMoreAuthManage(SM1_03VO vo) throws Exception;
}
