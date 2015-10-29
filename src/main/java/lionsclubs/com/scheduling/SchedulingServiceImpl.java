package lionsclubs.com.scheduling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jfile.service.JFileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SchedulingServiceImpl extends AbstractServiceImpl implements SchedulingService{
	@Autowired private SchedulingDAO dao;
	@Autowired private JFileService jFileService;
	
	@Override
	public void listDeleteFileId() throws Exception {
		
		List<String> listFileId = dao.listDeleteFileId();
		
		for(String fileId : listFileId){
			jFileService.removeAttachFiles(fileId);
		}
		
		dao.deleteFileId();
	}
}
