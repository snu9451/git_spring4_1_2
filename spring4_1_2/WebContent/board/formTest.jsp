<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(){
		document.f_test.submit();
	}
</script>
</head>
<body>
<!-- MN: action 속성을 통해 이동할 페이지/타게될 서블릿을 지정 -->
<!-- 	<form name="f_test" action="./getBoardList.sp4" method="get" > -->
	<form name="f_test" action="./getBoardList.sp4" method="post" >
		<input type="text" name="mem_name">
		<button onClick="send">제출하기</button>
<!-- 		<input type="submit" value="제출하기"> -->
	</form>
</body>
</html>