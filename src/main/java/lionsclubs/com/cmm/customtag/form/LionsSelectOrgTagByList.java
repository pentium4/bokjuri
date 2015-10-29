package lionsclubs.com.cmm.customtag.form;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import lionsclubs.com.cmm.web.organ.OrganVO;

/**
 * button
 * @author 한상균
 * @since 2013.02.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일			 수정자		 수정내용
 *  -----------		-------		---------------------------
 *   2013.02.21		 한상균		 최초 생성
 *
 * </pre>
 */

@SuppressWarnings("serial")
public class LionsSelectOrgTagByList extends TagSupport {
	private String id;
	private String name;
	private String selValue;
	private ArrayList<OrganVO> list;
	/*
     * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
     */
    @Override
    public int doEndTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            StringBuffer sb = new StringBuffer();
            sb.append("<select");
            
            if(!"".equals(id)) sb.append(" id=\"").append(id).append("\"");
            if(!"".equals(name)) sb.append(" name=\"").append(name).append("\"");
            sb.append(">");
            
            OrganVO vo = null;
            for (int i = 0; i < list.size(); i++) {
            	vo = list.get(i);
            	sb.append("<option value=\"").append(vo.getOrganCode()).append("\"");
            	if(vo.getOrganCode().equals(selValue)) sb.append(" selected=\"selected\"");
            	sb.append(">").append(vo.getKoName()).append("</option>");
            }
            sb.append("</select>");
            out.println(sb.toString());
        } catch(IOException e) {
            throw new JspException(e);
        }
        return 6;
    }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<OrganVO> getList() {
		return list;
	}
	public void setList(ArrayList<OrganVO> list) {
		this.list = list;
	}
	public String getSelValue() {
		return selValue;
	}
	public void setSelValue(String selValue) {
		this.selValue = selValue;
	}
}
