<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function volDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/volunteerDel.action?id="+id;
               }
           }
           
           function volAdd()
           {
                 var url="<%=path %>/admin/vol/volAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/img/tbg.gif">&nbsp;志愿者管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="15%">姓名</td>
					<td width="15%">性别</td>
					<td width="15%">联系电话</td>
					<td width="15%">Email</td>
					<td width="15%">QQ</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach var="user" items="${list }" varStatus="status">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">${status.index + 1}</td>
					<td bgcolor="#FFFFFF" align="center">${user.userName }</td>
					<td bgcolor="#FFFFFF" align="center">${user.userSex }</td>
					<td bgcolor="#FFFFFF" align="center">${user.userTel }</td>
					<td bgcolor="#FFFFFF" align="center">${user.userEmail }</td>
					<td bgcolor="#FFFFFF" align="center">${user.userQq }</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="volDel('${user.userId}')" class="pn-loperator">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="volAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
