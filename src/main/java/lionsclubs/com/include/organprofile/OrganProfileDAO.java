package lionsclubs.com.include.organprofile;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class OrganProfileDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.include.organprofile.";
	

	/**
	 * 현재클럽 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organProfile(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organProfile", vo);
	}
	
	/**
	 * 이전/다음 조직코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organCode(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organCode", vo);
	}	
	
	/**
	 * 현재클럽 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organProfileYear(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organProfileYear", vo);
	}
	
	/**
	 * 이전/다음 조직코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organCodeYear(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organCodeYear", vo);
	}
	
	/**
	 * 현재클럽 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organProfileYearMonth(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organProfileYearMonth", vo);
	}
	
	/**
	 * 이전/다음 조직코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organCodeYearMonth(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organCodeYearMonth", vo);
	}
	
	/**
	 * idnNo로 클럽정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organProfileIdnNo(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "organProfileIdnNo", vo);
	}	
	
	/**
	 * 스폰클럽, 생년월일, 입회일자를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO memberInfo(OrganProfileVO vo) throws Exception{
		return (OrganProfileVO)selectByPk(commonId + "memberInfo", vo);
	}
	
	/**
	 * 가이딩클럽명(스폰클럽)을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String guidingClubCodeName(OrganProfileVO vo) throws Exception{
		return (String)selectByPk(commonId + "guidingClubCodeName", vo);
	}
}
