<%@page import="org.apache.logging.log4j.core.util.JsonUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.util.HangulConversion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 구현 - WEB-INF</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css"
	href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path.toString() %>themes/icon.css">
<!-- jEasyUI JS 시작 -->
<script type="text/javascript"
	src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path.toString() %>js/jquery.easyui.min.js"></script>
</head>
<body>

	<!-- 	게시판 구현 페이지 입니다. WEB-INF -->
	<%-- 	<h1>${name}</h1> --%>
	<!-- 	<h1> -->
	<!-- 		입력된 이름: -->
	<%-- 		<% --%>
	<!-- 		out.println(HangulConversion.toUTF(request.getParameter("mem_name"))); -->
	<%-- 		%> --%>
	<!-- 	</h1> -->
	<%-- 	${list} --%>

	<table class="easyui-datagrid" id="data"
		data-options="title:'게시판', toolbar:'#tb_board'">
		<thead>
			<tr>
				<th data-options="field:'BM_NO'">글번호</th>
				<th data-options="field:'BM_TITLE'">제목</th>
				<th data-options="field:'BM_DATE'">작성일</th>
				<th data-options="field:'BM_FILE'">첨부파일</th>
				<th data-options="field:'BM_HIT'">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>001</td>
				<td>name1</td>
				<td>2323</td>
				<td>2323</td>
				<td>2323</td>
			</tr>
			<tr>
				<td>002</td>
				<td>name2</td>
				<td>4612</td>
				<td>2323</td>
				<td>2323</td>
			</tr>
		</tbody>
	</table>
	<div id="tb_board" style="padding:2px 5px;">
        <a href="#" id="btn" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
    </div>
</body>
    <script type="text/javascript">
    $(function(){
        $('#btn').bind('click', function(){
            alert('easyui');
        });
    });
//    document.querySelector("#search").addEventListener('click', function(){
//     	document.querySelector("#data").setAttribute('data-options', "url:'./jsonGetBoardList.sp4', title:'게시판', toolbar:'#tb_board'");
//     	console.log("버튼 클릭됨");
//    });
    </script>  
</html>