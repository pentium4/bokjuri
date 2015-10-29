package lionsclubs.com.include.profile;



public interface ProfileService {

	/**
	 * 현재 개인기본사항을 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public ProfileVO profile(ProfileVO vo) throws Exception;
}
