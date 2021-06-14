<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> boardDetail = 
		(List<Map<String,Object>>)request.getAttribute("boardDetail");
	String bm_email = null;
	String bs_file = null;
	String bm_title = null;
	String bm_writer = null;
	String bm_content = null;
	String bm_pw = null;
	String bm_no = null;
	String bm_group = null;
	String bm_pos = null;
	String bm_step = null;
	if(boardDetail!=null && boardDetail.size()>0){
// 		Map pmap = new HashMap();
// 		pmap = boardDetail.get(0);
// 		Object[] key = pmap.keySet().toArray();
// 		for(Object param : key){
// 		}
			
		bm_email = boardDetail.get(0).get("BM_EMAIL").toString();
		bs_file = boardDetail.get(0).get("BS_FILE").toString();
		bm_title = boardDetail.get(0).get("BM_TITLE").toString();
		bm_writer = boardDetail.get(0).get("BM_WRITER").toString();
		bm_content = boardDetail.get(0).get("BM_CONTENT").toString();
		bm_pw = boardDetail.get(0).get("BM_PW").toString();
		bm_no = boardDetail.get(0).get("BM_NO").toString();
// 		bm_group = boardDetail.get(0).get("BM_GROUP").toString();
// 		bm_pos = boardDetail.get(0).get("BM_POS").toString();
// 		bm_step = boardDetail.get(0).get("BM_STEP").toString();
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글상세보기</title>
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/icon.css"> 
<script type="text/javascript" src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString() %>js/jquery.easyui.min.js"></script>
<!-- 공통 코드 include처리 -->
<%-- <%@ include file="../common/easyui_common.jsp" %> --%>
<script type="text/javascript">
	function addAction(){
		$("#f_boardAdd").attr("method","post");
		$("#f_boardAdd").attr("action","/board/boardList.mvc?crud=ins");
		$("#f_boardAdd").submit();
		//부모창에 함수를 호출할때 opener.함수명();
		//opener.boardList();
		//self.close();
	}
	function updateForm(){
		//alert("updateForm 호출 성공");
		$('#d_boardUpd').dialog({
			title:'글수정'
		  ,width:720
		  ,height:450
		  ,closed:false
		  ,cache:false
		 ,modal:true	  
		});
		//$('#d_boardUpd').dialog('open');	
		//$('#d_boardUpd').dialog('refresh', '');
	}
	//댓글쓰기
	function repleForm(){
		$("#dlg_boardAdd").dialog('open');
	}
	//글삭제하기 이벤트 처리
	function boardDelView(){
		alert("boardDelView호출 성공");
		  $('#d_boardDel').dialog({
			    title: '글삭제',
			    buttons: btn_boardDel,
			    width: 420,
			    height: 250,
			    closed: true,
			    cache: false,
			    //href: 'boardDelForm.jsp?bm_no=<%=bm_no%>&bm_pw=<%=bm_pw%>',
			    modal: true
	   }); 
	   $('#d_boardDel').dialog('open');		
	}
	//글삭제 화면에서 확인 버튼을 클릭했을 때
	function boardDel(){
		var db_pw = <%=bm_pw%>
		var u_pw = $("#u_pw").textbox('getValue');
		//alert("db_pw:"+db_pw+", u_pw:"+u_pw);
		//alert("사용자가 입력한 비번:"+$("#db_pw").textbox('getValue'));
		//사용자가 입력한 비번과 DB에서 읽어온 비번을 비교하여
		//일치하면 삭제 처리 진행하고
		//불일치하면 비번을 다시 입력받도록 해주세요.
		if(u_pw==db_pw){
			//alert("같다");
			$.messager.confirm('Confirm','정말 삭제하시겠습니까?',function(r){
			 //r:true-ok, false-cancel
				if (r){//자바스크립트는 0이면 false 나머지 true
			    	location.href="./boardList.mvc?crud=del&bm_no=<%=bm_no%>&bs_file=<%=bs_file%>";    
			    }
			});
		}else{
			$("#db_pw").textbox('setValue','');
		}
	}
	function boardDelClose(){
		 $('#d_boardDel').dialog('close');
	}
	function boardList(){
		location.href="./getBoardList.jsp";
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		
<%-- 		$("#b_title").textbox('setValue','<%=rb_title%>');
		$("#b_name").textbox('setValue','<%=rb_name%>');
		$("#b_content").textbox('setValue','<%=rb_content%>');
		$("#b_pwd").textbox('setValue','<%=rb_pwd%>'); --%>
	});
</script>
    <table align="center" id="p" class="easyui-panel" title="글상세보기" data-options="footer:'#tb_read'"
        style="width:670px;height:380px;padding:10px;background:#fafafa;">
	    	<tr>
	    	<td>제목</td>
	    	<td><input id="bm_title" value="<%=bm_title%>" name="bm_title" data-options="width:'450px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>작성자</td>
	    	<td><input id="bm_writer" value="<%=bm_writer%>" name="bm_writer" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>이메일</td>
	    	<td><input id="bm_email" value="<%=bm_email%>" name="bm_email" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>내용</td>
	    	<td><input id="bm_content" value="<%=bm_content%>" name="bm_content" data-options="multiline:'true', width:'570px', height:'90px'" class="easyui-textbox"></td>
	    	</tr>
	    	<tr>
	    	<td>비밀번호</td>
	    	<td><input id="bm_pw" value="<%=bm_pw%>" name="bm_pw" class="easyui-passwordbox"></td>
	    	</tr>	    	
	   </table>
	 <div id="tb_read" style="padding:2px 5px;" align="center">
	    <a href="javascript:repleForm()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">댓글쓰기</a>
	    <a href="javascript:updateForm()" class="easyui-linkbutton" iconCls="icon-add" plain="true">수정</a>
	    <a href="javascript:boardDelView()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
	    <a href="javascript:boardList()" class="easyui-linkbutton" iconCls="icon-search" plain="true">목록</a>
	</div>
		<!-- 글삭제 시작 -->
		<div id="d_boardDel" closed="true" class="easyui-dialog" style="padding:20px 50px">
			<div id="btn_boardDel" align="right">
			<a href="javascript:boardDel()" class="easyui-linkbutton" iconCls="icon-ok" style="width:90px">확인</a>
			<a href="javascript:boardDelClose()" class="easyui-linkbutton" iconCls="icon-cancel" style="width:90px">닫기</a>
			</div>
		</div>
		<!-- 글삭제  끝   -->
		<!-- 글수정 시작 -->
		<div id="d_boardUpd" closed="true" class="easyui-dialog" style="padding:20px 50px">
<form id="uf_board" method="get" enctype="multipart/form-data">
<input type="hidden" id="b_no" name="b_no" value="<%=bm_no %>">
<input type="hidden" id="b_seq" name="b_seq" value="<%=1%>">
<input type="hidden" id="old_file" name="old_file" value="<%=bs_file %>">
<table align="center" width="650px" height="280px">
	<tr>
		<td width="120px">글제목</td>
		<td width="580px">
			<input id="b_title" value="<%=bm_title %>" name="b_title" class="easyui-textbox">
		</td>
	</tr>
	<tr>
		<td width="120px">작성자</td>
		<td width="580px">
			<input id="b_writer" value="<%=bm_writer %>" name="b_writer" class="easyui-textbox">
		</td>
	</tr>	
	<tr>
		<td width="120px">내용</td>
		<td width="580px">
			<input id="b_content" multiline="true" value="<%=bm_content %>" name="b_content" class="easyui-textbox" style="width:100%;height:100px">
		</td>
	</tr>	
	<tr>
		<td width="120px">첨부파일</td>
		<td width="580px">
			<input id="b_file" name="b_file" class="easyui-filebox" style="width:100%">
		</td>
	</tr>	
	<tr>
		<td width="120px">비번</td>
		<td width="580px">
			<input id="b_pw" name="b_pw" class="easyui-textbox" style="width:100px">
		</td>
	</tr>	
</table>
</form>		
			<div id="btn_boardUpd" align="right">
			<a href="javascript:boardUpd()" class="easyui-linkbutton" iconCls="icon-ok" style="width:90px">등록</a>
			<a href="javascript:boardUpdClose()" class="easyui-linkbutton" iconCls="icon-cancel" style="width:90px">닫기</a>
			</div>
		</div>
		<!-- 글수정  끝  -->
		<!-- 댓글쓰기 시작 -->
<!--================== [[댓글쓰기 화면]] ==================-->
<div id="dlg_boardAdd" title="댓글쓰기" class="easyui-dialog" style="width:600px;height:400px;padding:10px" data-options="closed:'true',modal:'true',footer:'#tbar_boardAdd'">	
<!-- 
form전송시 encType옵션이 추가되면 request객체로 사용자가 입력한 값을 꺼낼 수 없다.
MultipartRequest  => cos.jar
 -->	
	<form id="f_boardAdd" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bm_no" value="<%=bm_no%>">
	<input type="hidden" name="bm_group" value="<%=bm_group%>">
	<input type="hidden" name="bm_pos" value="<%=bm_pos%>">
	<input type="hidden" name="bm_step" value="<%=bm_step%>">
	<!-- <form id="f_boardAdd"> -->
	<table>
		<tr>
			<td width="100px">제목</td>
			<td width="500px">
				<input class="easyui-textbox" data-options="width:'350px'" id="bm_title" name="bm_title" required>
			</td>
		</tr>
		<tr>	
			<td width="100px">작성자</td>
			<td width="500px">
				<input class="easyui-textbox" data-options="width:'150px'" id="bm_writer" name="bm_writer" required>
			</td>
		</tr>
		<tr>
			<td width="100px">이메일</td>
			<td width="500px">
				<input class="easyui-textbox" data-options="width:'250px'" id="bm_email" name="bm_email">
			</td>
		</tr>
		<tr>			
			<td width="100px">내용</td>
			<td width="500px">
				<input class="easyui-textbox" id="bm_content" name="bm_content" data-options="multiline:'true',width:'400px',height:'90px'" required>
			</td>
		</tr>
		<tr>			
			<td width="100px">비번</td>
			<td width="500px">
				<input class="easyui-textbox" data-options="width:'100px'" id="bm_pw" name="bm_pw" required>
			</td>
		</tr>
	</table>
	</form>
</div>
<!-- 입력 화면 버튼 추가 -->
<div id="tbar_boardAdd" align="right">
	<a href="javascript:addAction()" class="easyui-linkbutton" iconCls="icon-save">저장</a>
	<a href="javascript:$('#dlg_boardAdd').dialog('close')" 
	   class="easyui-linkbutton" iconCls="icon-cancel">닫기</a>
</div>
		<!-- 댓글쓰기  끝  -->	    
</body>
</html>