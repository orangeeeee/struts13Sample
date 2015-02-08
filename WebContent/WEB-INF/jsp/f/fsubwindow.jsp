<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.apache.struts.Globals"%>
<%@ page import="org.apache.struts.util.MessageResources"%>
<%@ page import="org.apache.struts.taglib.TagUtils"%>
<%@ page import = "org.apache.struts.action.ActionMessages" %>
<%@taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/css/common.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/lib/jquery-1.11.0.min.js"></script>
<title>sub window</title>
</head>
<html:form styleId="inputForm">
	<input type="hidden" value="${pageContext.request.contextPath}" id="contextPath"/>
</html:form>
<script>

	var contextPath = document.getElementById('contextPath').value;

	w = window.open("",
		    "_self",
		    "resizable=no,scrollbars=yes,status=no");

	w.document.open();
	w.document.write("<title>タイトル</title><frameset><frame src=\"" + contextPath + "/pdf/8311_1.pdf\"></frameset>");

</script>
</body>
</html>