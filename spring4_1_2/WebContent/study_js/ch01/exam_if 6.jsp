<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/commonUIglobal.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exam_if_5 - 삼항연산자</title>
<script>
  function test(){
    let age = prompt('당신의 나이는?', 0);
    // if(1){
    if("hello"){
      // document.write("1은 참입니다.");
      document.write("hello는 참입니다.");
    }
    else {
      document.write("0은 거짓입니다.");
    }

  }
</script>
</head>
<body>
참 또는 거짓?
<br>
	<script type="text/javascript">test();</script>
</body>
</html>