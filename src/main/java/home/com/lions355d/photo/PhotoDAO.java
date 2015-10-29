package home.com.lions355d.photo;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class PhotoDAO extends LionsAbstractDAO{
	private String commonId = "home.com.lions355d.photo.";
	
	public Page listPhoto1(PhotoVO vo) throws Exception {
		return listWithPaging(commonId + "listPhoto1", vo);
	}	

	public Page listPhoto2(PhotoVO vo) throws Exception {
		return listWithPaging(commonId + "listPhoto2", vo);
	}
	
	public Page listPhoto3(PhotoVO vo) throws Exception {
		return listWithPaging(commonId + "listPhoto3", vo);
	}

	public Page listPhoto4(PhotoVO vo) throws Exception {
		return listWithPaging(commonId + "listPhoto4", vo);
	}
}
