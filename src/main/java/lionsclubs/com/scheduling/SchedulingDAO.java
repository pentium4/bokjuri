package lionsclubs.com.scheduling;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SchedulingDAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.scheduling.";

	@SuppressWarnings("unchecked")
	public List<String> listDeleteFileId() throws Exception {
		return list(commonId + "listDeleteFileId", null);
	}
	
	public Integer deleteFileId() throws Exception {
		return delete(commonId + "deleteFileId", null);
	}
}
