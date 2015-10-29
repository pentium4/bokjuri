package home.com.lions355d.photo;

import lionsclubs.com.cmm.pagging.Page;

public interface PhotoService {

	/**
	 * 지구 행사 사진 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listPhoto1(PhotoVO vo) throws Exception;

	/**
	 * 클럽 행사 사진 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listPhoto2(PhotoVO vo) throws Exception;

	/**
	 * 지구 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listPhoto3(PhotoVO vo) throws Exception;

	/**
	 * 클럽 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listPhoto4(PhotoVO vo) throws Exception;

}
