<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <div id="aaa" style="width: 300px; height: 300px; background-color: yellow;">하나</div>
  <div id="bbb" style="width: 100px; height: 100px; background-color: blue;">둘</div>
  <iframe src="../board/getBoardList.jsp" name="b"
         width="300px" height="300px" frameborder="0" scrolling="yes"marginwidth="0" marginheight="0">
           <p>이 문서는 &lt;iframe&gt;태그를 지원하는 웹 브라우저가 필요합니다.</p>
  </iframe>
  
  <script>
  	document.getElementById('aaa').addEventListener('click', event => {
  		console.log("안녕");
  	});
  	

  </script>
</body>
</html>