<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/lib/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/f/ffuncton.js"></script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
<h1>サンプルだから</h1>
<html:form styleId="inputForm">
<br>
<fieldset class="main-bg">
	<table  class="line-add-table">
		<tr>
			<th>削除</th>
			<th>プロジェクト名</th>
			<th>チーム名</th>
			<th>作業時間</th>
		</tr>
		<logic:iterate id="kinmBeanList" name="fInputForm" property="kinmBeanList" indexId="idx">
		<tr>
			<td>
				<input type="checkbox" />
			</td>
			<td>
				<html:text name="kinmBeanList" property="pjName" indexed="true"/>
			</td>
			<td>
				<html:text name="kinmBeanList" property="team" indexed="true"/>
			</td>
			<td>
				<html:text name="kinmBeanList" property="time" indexed="true"/>
			</td>
		</tr>
		</logic:iterate>
	</table>
	<bean:size id="kinmBeanListSize" name="fInputForm" property="kinmBeanList" />
	<input type="hidden" id="hKinmBeanListSize" name="kinmBeanListSize" value="<bean:write name="kinmBeanListSize" />"/>

	<br>
	<html:button styleId="regButton" property="buttonName">登録</html:button>
</fieldset>
</html:form>
</body>
</html>