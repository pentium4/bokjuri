package lionsclubs.com.cmm.web.organ;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class OrganDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.cmm.web.organ.";
	
	/**
	 * 조직Tree구조 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<OrganVO> organTreeList(OrganVO vo) throws Exception {
		return list(commonId + "organTreeList", vo);
	}

	/**
	 * 조직검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<OrganVO> organSearch(OrganVO vo) throws Exception {
		return list(commonId + "organSearch", vo);
	}	
	
	/*
	 * 조직의 레벨을 반환
	 */
	public String getOrgLevel(String orgCode) {
		return (String)this.selectByPk(commonId + "getOrgLevel", orgCode);
	}
	
	public String getDistrictCode(String clubCode) {
		return (String)this.selectByPk(commonId + "getDistrictCode", clubCode);
	}
	
	public String organCodetoName(String organCode) {
		return (String ) selectByPk(commonId + "organCodetoName", organCode);
	}
	
	public OrganVO byLvlOrganCode(OrganVO vo) throws Exception {
		return (OrganVO) selectByPk(commonId + "byLvlOrganCode", vo);
	}		
}
