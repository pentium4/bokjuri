package lionsclubs.com.include.organprofile;

public interface OrganProfileService {

	/**
	 * 현재클럽 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO clubProfile(OrganProfileVO vo) throws Exception;
	
	/**
	 * 현재지구 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO districtProfile(OrganProfileVO vo) throws Exception;
	
	/**
	 * 복합/연합회 정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO complexProfile(OrganProfileVO vo) throws Exception;
}
