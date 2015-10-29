package home.com.lions355d.home;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO extends LionsAbstractDAO{
	private String commonId = "home.com.lions355d.home.";

	@SuppressWarnings("unchecked")
	public List<HomeVO> listClubEventPhoto(HomeVO vo) throws Exception {
		return list(commonId + "listClubEventPhoto", vo);
	}	

	@SuppressWarnings("unchecked")
	public List<HomeVO> listClubEvent(HomeVO vo) throws Exception {
		return list(commonId + "listClubEvent", vo);
	}

	public String governorsPictureFile(HomeVO vo) throws Exception {
		return (String) selectByPk(commonId + "governorsPictureFile", vo);
	}
}
