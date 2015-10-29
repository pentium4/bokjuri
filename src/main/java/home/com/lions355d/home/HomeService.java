package home.com.lions355d.home;

import java.util.List;


public interface HomeService {

	/**
	 * 클럽 행사 사진 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<HomeVO> listClubEventPhoto(HomeVO vo) throws Exception;

	/**
	 * 클럽 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<HomeVO> listClubEvent(HomeVO vo) throws Exception;
	
	/**
	 * 현총재 사진
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String governorsPictureFile(HomeVO vo) throws Exception;
}
