<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/commonUIglobal.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exam_if_3</title>
<script>
  function test1(){
    if(1===1){
      document.write("같다");
    }
    else {
      document.write("다르다.");
    }
  }
  function test2(){
    if(1!=1){
      document.write("같다");
    }
    else {
      document.write("다르다.");
    }
  }
</script>
</head>
<body>
같니? 다르니? (1)
<br>
	<script type="text/javascript">test1();</script>
  <br> <!-- break 태그: 개행처리 태그 -->
  같니? 다르니? (2)
  <br>
	<script type="text/javascript">test2();</script>

</body>
</html>