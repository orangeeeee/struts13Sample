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
<title>Struts1.3.10 Sample</title>
</head>
<html:form styleId="inputForm">
<body>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
<%--
	 Struts1.2では、RequestUtils.getActionMessages(pageContext, Globals.ERROR_KEY);
	 Struts1.3では、TagUtils.getInstance().getActionMessages(pageContext, Globals.ERROR_KEY);
 --%>
<input type="hidden" id="errorsString" value="<%=TagUtils.getInstance().getActionMessages(pageContext, Globals.ERROR_KEY) %>">
<h1>サンプルだから</h1>
<br>
<fieldset class="main-bg">
	<table class="line-add-table" >
		<tr>
			<th>ActionErrors Trace</th>
		</tr>
		<tr>
			<td height="50px" width="500px">
				<%
				   ActionMessages errors = null;
				   try {
				     errors = TagUtils.getInstance().getActionMessages(pageContext, Globals.ERROR_KEY);
				   } catch (JspException e) {
				     out.println(e);
				   }
				   out.println(errors);
				%>
			</td>
		<tr>
	</table>
	</fieldset>
	<br>
	<fieldset class="main-bg">
	<div class="error-expend-area" style="display: none;" >
		<table class="errs-table">
			<tr>
				<td width="13px;">
					<div style="background-color: #FFB1B1;">
					</div>
				</td>
				<td>必須エラー</td>
			</tr>
			<tr>
				<td>
					<div style="background-color: #B8FAFF;">
					</div>
				</td>
				<td>半角数値エラー</td>
			</tr>
			<tr>
				<td>
					<div style="background-color: #B2FFDE;">
					</div>
				</td>
				<td>半角英数エラー</td>
			</tr>
		</table>
	</div>
	<div style="height:30px;">
		<html:button styleClass="button-s" styleId="createPDF" property="buttonName">Create PDF</html:button>
	</div>
	<html:button styleClass="button-s" styleId="addButton" property="buttonName">Add row</html:button>
	<html:button styleClass="button-s" styleId="delButton" property="buttonName">Del row</html:button>
	<br>
	<table  class="line-add-table">
		<tr>
			<th class="delchk-th">削除</th>
			<th>プロジェクト名</th>
			<th>チーム</th>
			<th class="omg-th">
				<table class="tableInTable">
					<tr>
						<th class="omg-th omg-top">omg1</th>
					</tr>
					<tr>
						<th class="omg-th omg-bottom">omg2</th>
					</tr>
				</table>
			</th>
			<th>作業時間</th>
		</tr>
		<tr id="zeroPoint"></tr>
		<logic:iterate id="kinmBeanList" name="fInputForm" property="kinmBeanList" indexId="idx">
		<tr id="addPointTr${idx}">
			<td class="delchk-td">
				<input type="checkbox" id="delchkId_${idx}" class="delchk" />
				<html:hidden styleId="changeFlg_${idx}" name="kinmBeanList" property="chgFlg" indexed="true"/>
				<html:hidden styleId="detailId_${idx}" name="kinmBeanList" property="detailId" indexed="true"/>
			</td>
			<td>
				<html:text styleId="pjName_${idx}" name="kinmBeanList" property="pjName" indexed="true"
					onchange="updChangeFlg(this.id);" maxlength="50"/>
			</td>
			<td>
				<html:text styleId="team_${idx}" name="kinmBeanList" property="team" indexed="true"
					onchange="updChangeFlg(this.id);" maxlength="3"/>
			</td>
			<td>
				<table class="tableInTable">
					<tr>
						<td class="omg-th omg-top">
							<html:text name="kinmBeanList" property="omg1" indexed="true" maxlength="3"
								styleId="omg1_${idx}" styleClass="widht-omg-txt" onchange="updChangeFlg(this.id);" />
						</td>
					</tr>
					<tr>
						<td class="omg-th omg-bottom">
							<html:text name="kinmBeanList" property="omg2" indexed="true" maxlength="3"
								styleId="omg2_${idx}" styleClass="widht-omg-txt" onchange="updChangeFlg(this.id);" />
						</td>
					</tr>
				</table>
			</td>
			<td>
				<html:text styleId="time_${idx}" name="kinmBeanList" property="time" indexed="true"
					onchange="updChangeFlg(this.id);" maxlength="3"/>
			</td>
		</tr>
		</logic:iterate>
	</table>
	<bean:size id="kinmBeanListSize" name="fInputForm" property="kinmBeanList" />
	<input type="hidden" id="hKinmBeanListSize" name="kinmBeanListSize" value="<bean:write name="kinmBeanListSize" />"/>
	<br>
	<html:button styleId="regButton" property="buttonName">登録</html:button>
</fieldset>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/f/ffuncton.js"></script>
</body>
</html:form>
</html>