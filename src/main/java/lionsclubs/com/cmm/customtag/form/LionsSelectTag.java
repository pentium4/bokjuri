package lionsclubs.com.cmm.customtag.form;

import java.util.Enumeration;
import java.util.List;

import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.tags.form.SelectTag;

public class LionsSelectTag extends SelectTag {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CommonCodeService service;
	
	private String groupCode;
	private Boolean onlyCodeName;
	private Boolean top = true;
	private String topLabel;

	public LionsSelectTag() {
		this.setOnlyCodeName(false);
	}
	
	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	
	public Boolean getOnlyCodeName() {
		return onlyCodeName;
	}

	public void setOnlyCodeName(Boolean onlyCodeName) {
		this.onlyCodeName = onlyCodeName;
	}
	
	public CommonCodeService getService() {
		return service;
	}

	public void setService(CommonCodeService service) {
		this.service = service;
	}

	public Boolean getTop() {
		return top;
	}

	public void setTop(Boolean top) {
		this.top = top;
	}

	public String getTopLabel() {
		return topLabel;
	}

	public void setTopLabel(String topLabel) {
		this.topLabel = topLabel;
	}

	@Override
	protected Object getItems() {
		service = (CommonCodeService) getRequestContext().getWebApplicationContext().getBean(CommonCodeService.class);
		
		List<CommonCodeVO> list = null;
		
		try {
			if(getOnlyCodeName()){
				list = service.codelistSimple(getGroupCode());
			}else{
				list = service.codelist(getGroupCode());
			}
			
			if(getTop()){
				CommonCodeVO vo = new CommonCodeVO();
				vo.setCode("");
				if(StringUtils.isEmpty(getTopLabel())){
					vo.setCodeName("-- 선택 --");
				} else {
					vo.setCodeName(getTopLabel());
				}
				
				list.add(0, vo);			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	protected String getItemValue() {
		return "code";
	}
	
	@Override
	protected String getItemLabel() {
		return "codeName";
	}
	
	@Override
	public Enumeration<String> getValues() {
		// TODO Auto-generated method stub
		return super.getValues();
	}
}
