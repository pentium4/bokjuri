<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09VO" %>
<%
List<SM1_09VO> leftMenuList = (List<SM1_09VO>)request.getAttribute("leftMenuList");

SM1_09VO menuAuthorization = (SM1_09VO)request.getAttribute("menuAuthorization");

int menu1 = menuAuthorization.getMenu1();
int menu2 = menuAuthorization.getMenu2();
int menu3 = menuAuthorization.getMenu3();
%>
<div id="LNB" class="cscroll">
	<p><img src="/images/lionsclubs/sub/busi_title.gif" alt="업무통합관리시스템" /></p>
	<h1>
		<div>
			<strong id="menuTitle"></strong><br />
			<span>Korea Lions Club</span>
			<img src="/images/lionsclubs/sub/menu_off.gif" class="pointer" />
		</div>
	</h1>
	<h2><img src="/images/lionsclubs/sub/menu_on.gif" class="pointer" /></h2>
	<div>
		<%
			int tempMenu2 = 0; 
			int index = 0; 
			int menuListLength = leftMenuList.size() - 1;
			int titleIndex = 0;
			int subTitleIndex = 0;
			for(SM1_09VO vo : leftMenuList){
				if(vo.getMenu1().equals(Integer.valueOf(menu1))){
					if(vo.getMenu3() == 0){
						if(titleIndex > 0){
							out.print("</ul></div>");	
						}
						out.print("<div>");
						out.print("<h3>" + vo.getTitle() + "</h3><ul>");
						titleIndex++;
					} else {
						int menuId = vo.getUiNo();
						String param = vo.getUrl().split("\\?").length > 1 ? "&menuId=" + menuId : "?menuId=" + menuId;
						out.print("<li class='ellipsis' title='" + vo.getTitle() + "'><a href='" + vo.getUrl() + param + "'>" + vo.getTitle() + "</a></li>");
						subTitleIndex++;
					}
				}
				
				if(index == menuListLength){ 
					out.print("</ul></div>"); 
				} 
				
				index++;
			} 
		%>			
	</div>
</div><!-- LNB -->


<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		var menu1 = "${menuAuthorization.menu1 }";
		var menu2 = "${menuAuthorization.menu2 }";
		var menu3 = "${menuAuthorization.menu3 }";
		GLNB_Select(menu1 == 0 ? 0 : menu1 - 1,menu2 == 0 ? 0 : menu2 - 1,menu3 == 0 ? 0 : menu3 - 1);
	});
});
//-->
</script>

