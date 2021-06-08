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
<title>게시판 목록[WebContent]</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/icon.css"> 
<!-- jEasyUI JS 시작 -->
<script type="text/javascript" src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString() %>js/jquery.easyui.min.js"></script>   
<script>
	'use strict'
	$(document).ready(()=>{
	    $('#dg_board').datagrid({
	        toolbar: '#tb_board2'
	    });
	});

  function search(){
    console.log("조회 호출");
    $('#dg_board').datagrid({
        url:'jsonGetBoardList.sp4'
    });

  }
  
  function insert(){
	  console.log("입력 호출");
	  $("#dlg_ins").dialog('open');
  }
  
  $('.tb_insert').textbox({
		icons: [{
			iconCls:'icon-add',
			handler: function(e){
				$(e.data.target).textbox('setValue', 'Something added!');
			}
		},{
			iconCls:'icon-remove',
			handler: function(e){
				$(e.data.target).textbox('clear');
			}
		}]
	})
	
	$('.easyui-linkbutton').on('click', ()=>{
		$('#tb_form').submit();
	});
  
</script>
</head>
<body>
<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판 webapp'" style="width:500px;height:350px">
    <thead>
        <tr>
            <th data-options="field:'BM_NO'">글번호</th>
            <th data-options="field:'BM_TITLE'">제목</th>
            <th data-options="field:'BM_DATE'">작성일</th>
            <th data-options="field:'BS_FILE'">첨부파일</th>
            <th data-options="field:'BM_HIT'">조회수</th>
        </tr>
    </thead>
</table>
    <div id="tb_board2" style="padding:2px 5px;">
        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a href="javascript:insert()" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
    </div>
    <!-- ------------------------------------[[ 글쓰기 화면 시작 ]]--------------------------------------------- -->
    <form id="tb_form" method="post">
	<div id="dlg_ins" class="easyui-dialog" title="글쓰기 화면"
		data-options="iconCls:'icon-save'"
		style="width: 700px; height: fit-content; padding: 10px">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_email" label="작성자명:" labelPosition="top" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_email" label="이메일:" labelPosition="top" data-options="prompt:'Enter a email address...',validType:'email'" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="bm_content" label="글 내용:" labelPosition="top" style="width:100%; height:150px;" data-options="multiline:true, prompt: '이곳에 글 내용을 입력하세요.'">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-filebox" label="파일 첨부:" labelPosition="top" style="width:100%;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-passwordbox" name="bm_pw" prompt="Password" iconWidth="28" label="비밀번호 입력:" labelPosition="top" style="width:100%;">
        </div>
        <div>
            <a class="easyui-linkbutton" iconCls="icon-add" style="width:100%;height:32px">Register</a>
    	</div>
	</div>
	</form>
	
	<!-- -------------------------------------[[ 글쓰기 화면 끝 ]]--------------------------------------------- -->
</body>