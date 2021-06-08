<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 목록 페이지</title>
</head>
<body>
	empList 출력<br>
	사원 목록 페이지입니다.<br>
<%
	// SSR과 CSR이 공존
	// 서블릿에서 EmpLogic.java -> EmpDao.java -> List<Map>
	// mav.addObject("empList", empList);
	// request.setAttribute("empList", empList);
	// 이러한 방식이 [forward]방식이다.
	List<Map<String, Object>> empList = (List<Map<String, Object>>)request.getAttribute("empList");
	out.println(empList);
	int size=0;
	if(empList!=null){
		size = empList.size();
	}
	/* or(Map<String, Object> map : empList){
		
		out.println()
	} */
%>
	${empList.toString()}
</body>
</html>