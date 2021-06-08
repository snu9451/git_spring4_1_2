<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Obj_tv</title>
</head>
<body>
  <!-- 바로 테스트가 가능하도록 body 안쪽에서 script를 정의하기로 한다. -->
  <script type="text/javascript">
    var tv = new Object();
    tv.color = "black";
    tv.price = 300000;
    tv.info = function(){
      document.write("색상: "+tv.color,"<br>");
      document.write("가격: "+tv.price);
    }
    tv.info();
    const today = new Date();
    const mon = today.getMonth();
    const date = today.getDate();
    const day = today.getDay();
    const worldCup = new Date(2020, 4, 30);
    const mon1 = worldCup.getMonth();
    const date1 = worldCup.getDate();
    const day1 = worldCup.getDay();
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    document.write("오늘은 ", mon, "월 ", date, "일 ", week[day], "요일 ","<br>");
    document.write("월드컵은은 ", mon1, "월 ", date1, "일 ", week[day1], "요일 ");

  </script>
</body>
</html>