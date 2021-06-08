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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  // 자바스크립트를 이용한 링크 이동 처리
  function test(){
    $("h2").each(function(index){
      $("h2").eq(index).on('click', function(){
        console.log($("h2").eq(index).text());
        let site = $("h2").eq(index).text(); 
        switch(site){
          case "네이버":
            location.href="http://www.naver.com"
            break;
          case "구글":
            location.href="http://google.com"
            break;
          case "다음":
            location.href="http://www.daum.net"
            break;
        }
      });
    })
  }
</script>
</head>
<body>
<h1>네이버, 구글, 다음 중 즐겨 사용하는 사이트는 무엇입니까?</h1>
(선택 시 해당 사이트로 이동합니다.)
<div style="text-align: center; align-content: center;">
<h2 style="background-color: antiquewhite; width:100px;">네이버</h2>
<h2 style="background-color: aqua; width:100px;">구글</h2>
<h2 style="background-color: aquamarine; width:100px;">다음</h2>
</div>
<script type="text/javascript">test();</script>
</body>
</html>