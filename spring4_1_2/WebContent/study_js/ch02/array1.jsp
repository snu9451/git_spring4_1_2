<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Array1</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<h1>배열을 이용해서 테이블을 그려봅시다.</h1>
  <script type="text/javascript">
    
    const d1 = new Array();
    d1[0] = 30;
    d1[1] = "따릉이";
    d1[2] = true;

    const d2 = new Array(50, "노트북", false);

    const d3 = [70, "핸드폰", true];

    // for문으로 꺼내기 위해 배열들을 배열에 담기
    const d = [d1, d2, d3];

    document.write("<table style='text-align: center; width: 400px;'><tr><th>int</th><th>String</th><th>boolean</th></tr>");
    for (let j=0; j<d.length; j++){
      document.write("<tr>");

        for(let i=0; i<3; i++){
          document.write("<td>");
          document.write(d[j][i]);
          console.log(d[j][i]);
          document.write("</td>");
        }
      document.write("</tr>");
    }

    document.write("</table>");

  // 스크립트로 생성된 DOM 요소 조작하기
  $("table").css('border','3px solid black');
  $("td").css('border','1px dashed black');
  $("th").css('border','1px dashed black');
  </script>
</body>
</html>