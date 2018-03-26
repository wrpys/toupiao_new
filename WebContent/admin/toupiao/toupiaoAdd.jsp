<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
        
        <script language="javascript">
        
        	var mingchengType = "<%=request.getParameter("mingchengType") %>";
		
        	var letter = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
        
        	var _html = [];
        	_html.push('<tr class="answerTemplate" align="center" bgcolor="#FFFFFF" height="22">');
        	_html.push('<td width="10%" bgcolor="#FFFFFF" align="right"></td>');
        	_html.push('<td width="90%" bgcolor="#FFFFFF" align="left"></td>');
        	_html.push('</tr>');
        	
            function add() {
            	var ats = $(".answerTemplate");
            	ats.find("input.del").remove();
        		var at = ats.eq(ats.length - 1);
        		at.after(_html.join(""));
        		ats = $(".answerTemplate");
        		at = ats.eq(ats.length - 1);
        		var tds = at.find("td");
        		tds.eq(0).append(letter[ats.length - 1] + "：");
        		tds.eq(1).append('<input type="text" name="answer' + letter[ats.length - 1] + '" size="80"/><input class="del" type="button" value="删除" onclick="del()"/>');
            }
            
            function del() {
            	// 删除最后一个答案列表
            	var ats = $(".answerTemplate");
            	if (ats.length <= 2) {
            		alert("答案不能少于两个！");
            		return ;
            	}
            	var at = ats.eq(ats.length - 1);
            	at.remove();
            	// 删除最后一个后，为下一个最后一个添加删除按钮
            	ats = $(".answerTemplate");
            	at = ats.eq(ats.length - 1);
            	var tds = at.find("td");
            	tds.eq(1).append('<input class="del" type="button" value="删除" onclick="del()"/>');
            }
          
          
          function c()
          {
               if(document.formAdd.title.value=="")
               {
                   alert("请输入题目标题");
                   return false;
               }
               
               document.formAdd.submit();
          }
        </script>
	</head>

	<body leftmargin="1" topmargin="3" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/toupiaoAdd.action" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;新增题目&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						             题目标题：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       	 <input type="text" name="title" size="80"/>
						       	 <input type="button" value="添加选项" onclick="add()"/>
						    </td>
						</tr>
						<tr class="answerTemplate" align="center" bgcolor="#FFFFFF" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						    A：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						    	<input type="text" name="answerA" size="80"/>
						    </td>
						</tr>
						<tr class="answerTemplate" align="center" bgcolor="#FFFFFF" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						    B：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						    	<input type="text" name="answerB" size="80"/>
						    	<input class="del" type="button" value="删除" onclick="del()"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="wenjuan_id" value="<%=request.getParameter("wenjuan_id") %>"/>
						       <input type="button" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
