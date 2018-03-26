<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
String mingchengType = request.getParameter("mingchengType");
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
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery-ui.css" />
        <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
        
        <c:set var="mingchengType" value="<%=mingchengType %>"/>
        
        <script language="javascript">
        	var currentSubjectRelId = null;
        	
        	var mingchengType = "${mingchengType}";
		
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
        		var _html2 = [];
        		//debugger;
        		_html2.push('<input type="text" name="answer[' + (ats.length-1) + '].answerContent" size="80"/>');
        		if(mingchengType == "2" && $("select[name='subjectType']").val() == "1") {
        			_html2.push('<input type="hidden" name="answer[' + (ats.length-1) + '].subjectRelId" /><input class="selectToupiao" type="button" value="选择题目" onclick="selectToupiao(this)"/>');
        		}
        		_html2.push('<input class="del" type="button" value="删除" onclick="del()"/>');
        		tds.eq(1).append(_html2.join(""));
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
            
            function selectType(type) {
            	if(type == "1" || type == "2") {
            		$(".answerTemplate").show();
            		$(".textAnswerTemplate").hide();
            	} else if(type == "3") {
            		$(".answerTemplate").hide();
            		$(".textAnswerTemplate").show();
            	} 
            }
          
            function selectToupiao(obj) {
           	    $("#dialog").dialog("open");
           	 	currentSubjectRelId = $(obj).prev();
            	//alert($(obj).prev().attr("name"));
            	console.log(currentSubjectRelId);
            }
          
          function c() {
        	  var subjectTitle = $("input[name='subjectTitle']").val();
              if(subjectTitle=="") {
                  alert("请输入题目标题");
                  return false;
              }
        	  var subjectType = $("select[name='subjectType']").val();
              if(subjectType == "1" || subjectType == "2") {
            		$(".textAnswerTemplate").remove();
  	          } else if(subjectType == "3") {
  	          		$(".answerTemplate").remove();
  	          }
              document.formAdd.submit();
          }
          
         	$(function(){
         		$("#dialog").dialog({
         		      autoOpen: false,
         		      modal: true,
         		      width: 700,
         		      height: 500,
         		      open: function(ev, ui){  
         	             $('#subjectRel').attr('src','http://www.baidu.com');  
         	          }
         		    });
         	})
          
        </script>
	</head>

	<body leftmargin="1" topmargin="3" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/<c:if test="${mingchengType==1}">toupiaoShunxuAdd.action</c:if><c:if test="${mingchengType==2}">toupiaoTiaozhuanAdd.action</c:if>" 
				name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;新增题目&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						             题目标题：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       	 <input type="text" name="subjectTitle" size="80"/>
						       	 <input type="button" value="添加选项" onclick="add()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						             题目类型：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       	 <select name="subjectType" onchange="selectType(this.value)" >
						       	 	<option value="1">单选</option>
						       	 	<c:if test="${mingchengType == 1}">
							       	 	<option value="2">多选</option>
						       	 	</c:if>
						       	 	<option value="3">文本</option>
						       	 </select>
						    </td>
						</tr>
						<tr class="answerTemplate" align="center" bgcolor="#FFFFFF" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						    A：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						    	<input type="text" name="answer[0].answerContent" size="80"/>
						    	<c:if test="${mingchengType == 2}">
						    		<input type="hidden" name="answer[0].subjectRelId" />
						    		<input class="selectToupiao" type="button" value="选择题目" onclick="selectToupiao(this)"/>
						    	</c:if>
						    </td>
						</tr>
						<tr class="answerTemplate" align="center" bgcolor="#FFFFFF" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						    B：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						    	<input type="text" name="answer[1].answerContent" size="80"/>
						    	<c:if test="${mingchengType == 2}">
						    		<input type="hidden" name="answer[1].subjectRelId" />
						    		<input class="selectToupiao" type="button" value="选择题目" onclick="selectToupiao(this)"/>
						    	</c:if>
						    	<input class="del" type="button" value="删除" onclick="del()"/>
						    </td>
						</tr>
						
						<tr class="textAnswerTemplate" style="display: none;" align="center" bgcolor="#FFFFFF" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						          答案：
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						    	<textarea name="answer[0].answerContent" cols="78" rows="8"></textarea>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="10%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="90%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="wenjuanId" value="<%=request.getParameter("wenjuan_id") %>"/>
						       <input type="button" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
			<div id="dialog" title="选择题目">
			  <iframe noresize="" id="subjectRel" name="subjectRel" scrolling="yes"></iframe>
			</div>
   </body>
</html>
