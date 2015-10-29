package lionsclubs.com.cmm.web.organ;

import java.util.List;

public interface OrganService {

	/**
	 * 조직Tree구조 리스트
	 * @return
	 * @throws Exception
	 */
	public List<OrganVO> organTreeList(OrganVO vo) throws Exception;

	/**
	 * 조직검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<OrganVO> organSearch(OrganVO vo) throws Exception;
	
	public String getOrgLevel(String orgCode) throws Exception;
	
	public String getDistrictCode(String clubCode) throws Exception;
	
	/**
	 * 검색유지 조직코드를 저장한다.
	 * @param clubCode
	 * @throws Exception
	 */
	public void saveSearchOrganCode(OrganVO vo) throws Exception;
	
	/**
	 * 조직코드를 해서 조직명을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String organCodetoName(String organCode) throws Exception;
}
