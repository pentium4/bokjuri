<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<table border="0" cellspacing="0"  cellpadding="0" width="650px" align="left">
<tr valign="top">
<td>
  <p align="center">
<script language="JavaScript">
function namosw_goto_byselect(sel, targetstr)
{
  var index = sel.selectedIndex;
  if (sel.options[index].value != '') {
     if (targetstr == 'blank') {
       window.open(sel.options[index].value, 'win1');
     } else {
       var frameobj;
       if (targetstr == '') targetstr = 'self';
       if ((frameobj = eval(targetstr)) != null)
         frameobj.location = sel.options[index].value;
     }
  }
}
</script>

<table border="0" cellpadding="0" cellspacing="0" width="650" style="background: url('/images/home/common/bbs_box_bg.gif');">
<form name="form">
    <tr>
        <td width="10">
            <p style="margin: 0;"><img src="/images/home/common/bbs_box_left.gif" width="10" height="40" border="0"></p>
        </td>
        <td>
            <p style="margin: 0;">&nbsp;<strong><font color="#339933">국제라이온스 협회 355-D지구 총재 인사말</font></strong></p>
        </td>
        <td width="150" align="right">
                        <p style="margin: 0;"><select size="1" OnChange="namosw_goto_byselect(this, 'view')">
                            <option selected value="/home/355d/district/governorsMsgHistory/20142015.do">FY.2014-2015</option>
                            <option value="/home/355d/district/governorsMsgHistory/20132014.do">FY.2013-2014</option>
                            <option value="/home/355d/district/governorsMsgHistory/20122013.do">FY.2012-2013</option>
                            <option value="/home/355d/district/governorsMsgHistory/20112012.do">FY.2011-2012</option>
                            <option value="/home/355d/district/governorsMsgHistory/20102011.do">FY.2010-2011</option>
                            <option value="/home/355d/district/governorsMsgHistory/20092010.do">FY.2009-2010</option>
                            <option value="/home/355d/district/governorsMsgHistory/20082009.do">FY.2008-2009</option>
                            <option value="/home/355d/district/governorsMsgHistory/20072008.do">FY.2007-2008</option>
                            <option value="/home/355d/district/governorsMsgHistory/20062007.do">FY.2006-2007</option>
                            <option value="/home/355d/district/governorsMsgHistory/20052006.do">FY.2005-2006</option>
                            <option value="/home/355d/district/governorsMsgHistory/20042005.do">FY.2004-2005</option>
               			    <option value="/home/355d/district/governorsMsgHistory/20032004.do">FY.2003-2004</option>
                            <option value="/home/355d/district/governorsMsgHistory/20022003.do">FY.2002-2003</option>
                         </p>
        </td>
        <td width="10">
            <p style="margin: 0;"><img src="/images/home/common/bbs_box_right.gif" width="10" height="40" border="0"></p>
        </td>
    </tr>
</form>
</table><p>

<table border="0" cellpadding="0" cellspacing="0" width="650" height="20">
    <tr>
        <td height="700" align="center" valign="top">
           <iframe src="/home/355d/district/governorsMsgHistory/20142015.do" name="view" width="650" height="940" scrolling="no" frameborder="0" hspace="0" vspace="0"></iframe>
        </td>
    </tr>
</table><p><br>

</td>
</tr>
</table>