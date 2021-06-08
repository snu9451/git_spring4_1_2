<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/commonUIglobal.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exam_if_4</title>
<script>
  function test1(){
    if(true && true){
      // 플러스 연산자(+)처럼 콤마(,)도 연결해주는 연산자이다.
      document.write("같다.","<br>");
    }
    else {
      document.write("다르다.");
    }
  }
</script>
</head>
<body>
같니? 다르니?
<br>
	<script type="text/javascript">test1();</script>
</body>
</html>