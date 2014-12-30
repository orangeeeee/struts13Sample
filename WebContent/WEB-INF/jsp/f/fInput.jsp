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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/javascript/lib/grid/Grid.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/lib/jquery-1.11.0.min.js"></script>
<style type="text/css">
	#demoLinks{
		margin:0px;
		line-height:1.5em;
		font-size:12px;
		}
	#demoDiv{
		margin:0px;
		border:1px solid #7F7F7F;
		width:980px;
		height:400px;
		background-color:#7F7F7F;
		}
	#demoGrid{
		width:100%;
		height:100%;
		background-color:#fff;
		color:#1a2731;
		overflow:auto;
		}
	#demoTable{
		border-spacing:0px;
		border-collapse:collapse;
		line-height:1.5em;
		font-size:12px;
		color:#333;
		}
</style>
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
	<html:button styleClass="button-s" styleId="addButton" property="buttonName">行追加</html:button>
	<html:button styleClass="button-s" styleId="delButton" property="buttonName">行削除</html:button>
	<br>
	<div id="demoDiv">
		<div id="demoGrid">
				<table id="demoTable">
					<colgroup><col id="demoTableCol1"></colgroup>
					<thead>
						<tr>
							<th><span id="demoHdr0" title="">削除</span></th>
							<th><span id="demoHdr1" title="">プロジェクト名</span></th>
							<th><span id="demoHdr2" title="">チーム</span></th>
							<th><span id="demoHdr3" title="">作業時間</span></th>
						</tr>
					</thead>
					<tbody>
						<logic:iterate id="kinmBeanList" name="fInputForm" property="kinmBeanList" indexId="idx">
						<tr  id="addPointTr${idx}">
							<td class="txt">
								<input type="checkbox" id="delchkId_${idx}" class="delchk" />
								<html:hidden styleId="changeFlg_${idx}" name="kinmBeanList" property="chgFlg" indexed="true"/>
								<html:hidden styleId="detailId_${idx}" name="kinmBeanList" property="detailId" indexed="true"/>
							</td>
							<td class="txt">
								<html:text styleId="pjName_${idx}" name="kinmBeanList" property="pjName" indexed="true"
									onchange="updChangeFlg(this.id);" maxlength="50"/>
							</td>
							<td class="txt">
								<html:text styleId="team_${idx}" name="kinmBeanList" property="team" indexed="true"
									onchange="updChangeFlg(this.id);" maxlength="3"/>
							</td>
							<td class="txt">
								<html:text styleId="time_${idx}" name="kinmBeanList" property="time" indexed="true"
									onchange="updChangeFlg(this.id);" maxlength="3"/>
							</td>
						</tr>
						</logic:iterate>
					</tbody>
				</table>
		</div>
	</div>

	<br>
	<table  class="line-add-table">
		<tr>
			<th>削除</th>
			<th>プロジェクト名</th>
			<th>チーム</th>
			<th>作業時間</th>
		</tr>
		<tr id="zeroPoint"></tr>

	</table>
	<bean:size id="kinmBeanListSize" name="fInputForm" property="kinmBeanList" />
	<input type="hidden" id="hKinmBeanListSize" name="kinmBeanListSize" value="<bean:write name="kinmBeanListSize" />"/>
	<br>
	<html:button styleId="regButton" property="buttonName">登録</html:button>
</fieldset>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/f/ffuncton.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/view/javascript/lib/grid/Grid.js"></script>
		<script type="text/javascript">
			(function(window, document, undefined) {
				"use strict";
				//タイトルの寄せを調整（"string", "number", "date", "custom", "none"）
				var gridColSortTypes = ["string", "string", "string", "string", "string"],
				    gridColAlign = [];

				var onColumnSort = function(newIndexOrder, columnIndex, lastColumnIndex) {
					var offset = (this.options.allowSelections && this.options.showSelectionColumn) ? 1 : 0,
					    doc = document;

					if (columnIndex !== lastColumnIndex) {
						if (lastColumnIndex > -1) {
							doc.getElementById("demoHdr" + (lastColumnIndex - offset)).parentNode.style.backgroundColor = "";
						}
						doc.getElementById("demoHdr" + (columnIndex - offset)).parentNode.style.backgroundColor = "#f7f7f7";
					}
				};

				var onResizeGrid = function(newWidth, newHeight) {
					var demoDivStyle = document.getElementById("demoDiv").style;
					demoDivStyle.width = newWidth + "px";
					demoDivStyle.height = newHeight + "px";
				};

				for (var i=0, col; col=gridColSortTypes[i]; i++) {
					gridColAlign[i] = (col === "number") ? "right" : "left";
				}

				var myGrid = new Grid("demoGrid", {
				    	srcType : "dom",
				    	srcData : "demoTable",
				    	allowGridResize : true,
				    	allowColumnResize : true,
				    	allowClientSideSorting : true,
				    	allowSelections : true,
				    	allowMultipleSelections : true,
				    	showSelectionColumn : true,
				    	onColumnSort : onColumnSort,
				    	onResizeGrid : onResizeGrid,
				    	colAlign : gridColAlign,
				    	colBGColors : ["#F5F5F5"],
				    	colSortTypes : gridColSortTypes,
				    	fixedCols : 2
				    });
			})(this, this.document);
		</script>
</body>
</html:form>
</html>