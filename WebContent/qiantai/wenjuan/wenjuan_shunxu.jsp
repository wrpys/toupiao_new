<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/jquery-ui.css" />
        <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
		<style type="text/css">
			*{
				border: 0;
			}
			html {
				height: 95%;
			}
			body {
				height: 98%;
			}
			form {
				height: 100%;
			}
			.main{
				height: 85%;
			}
			.footer {
				border-top: 1px solid #ddd;
				height: 12%;
			}
			.footer button {
				float: right;
				margin-top: 15px;
				margin-right: 20px;
				padding: 6px 10px;
    			background: #3385ff;
			}
			.title {
			    border: 1px solid #ddd;
			    padding: 5px 10px;
			}
			li {
				list-style: none;
				margin-bottom: 8px;
			}
			
		</style>
	    <script type="text/javascript">
    	   var wenjuan_id = null;
	       function wenjuanDetailQian(id)
           {
           } 
	    </script>
	</head>

	<body>
		<form action="<%=path%>/getTimuByWenjuanId1.action">
			<div class="main">
				<input type="hidden" name="wenjuan_id" value="${subject.wenjuanId}" />
				<input type="hidden" name="subject_id" value="${subject.subjectId}" />
				<div class="title"><label>题目：</label>${subject.subjectTitle}</div>
				<c:if test="${subject.subjectType == 1}">
				<ul>
					<c:forEach var="answer" items="${answers}" varStatus="vs">
					<li>
						<label>
							<c:set var="index" value="${vs.index}" />
							<c:out value="${subject.getLetterByIndex(index)}" />:
						</label>
						<input type="radio" name="answer" value="${answer.answerId}"/>${answer.answerContent}
					</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${subject.subjectType == 2}">
				<ul>
					<c:forEach var="answer" items="${answers}" varStatus="vs">
					<li>
						<label>
							<c:set var="index" value="${vs.index}" />
							<c:out value="${subject.getLetterByIndex(index)}" />:
						</label>
						<input type="checkbox" name="answer" value="${answer.answerId}"/>${answer.answerContent}
					</li>
					</c:forEach>
				</ul>
				</c:if>
				<c:if test="${subject.subjectType == 3}">
					<textarea rows="15" cols="99" name="answer" style="border: 1px solid #ddd;margin-top: 10px;"></textarea>
				</c:if>
			</div>
			<div class="footer">
				<button>确 定</button>
			</div>
		</form>
	</body>
</html>
